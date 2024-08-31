import { NextFunction, Request, Response } from "express";
import mongoose, { isValidObjectId } from "mongoose";
import { asyncHandler, parse } from "../export";

interface PaginatedResult {
  totalCount?: number;
  totalPages?: number;
  currentPage?: number;
  limit?: number;
  data?: Array<any>;
}

const pagination = asyncHandler(
  async (req: Request, res: Response, next: NextFunction) => {
    // Copy req.query
    const reqQuery = { ...parse(req.query) };

    // Fields to exclude
    const removeFields = ["select", "sort", "page", "limit"];

    // Loop over removeFields and delete them from reqQuery
    removeFields.forEach((param) => delete reqQuery[param]);
    // Create query string
    let queryStr = JSON.stringify(reqQuery);

    // Create operators ($gt, $gte, etc)
    queryStr = queryStr.replace(
      /\b(gt|gte|lt|lte|in|ne)\b/g,
      (match) => `$${match}`
    );

    const filters = JSON.parse(queryStr);
    filters.archived = { $ne: true };
    const pageNumber = parseInt(req.query.page?.toString() ?? "") || 1;
    const limit = parseInt(req.query.limit?.toString() ?? "") || 25;
    let sortBy: any;
    let selected: any;

    if (req.query.select) {
      selected = req.query.select;
    }

    if (req.query.sort) {
      sortBy = req.query.sort;
    } else {
      sortBy = "createdAt";
    }
    const result: PaginatedResult = {};
    const model = req.model;
    for (let key of Object.keys(filters)) {
      if (Array.isArray(filters[key])) {
        filters[key] = { $in: filters[key] };
      }
    }
    let startIndex = (pageNumber - 1) * limit;
    const [data, totalPosts] = await Promise.all([
      model
        .find(filters)
        .collation({ locale: "en_US", strength: 2 })
        .sort(sortBy)
        .skip(startIndex)
        .limit(limit)
        .select(selected),
      model!.countDocuments(filters),
    ]);
    result.data = data;
    result.totalCount = totalPosts;
    result.totalPages = Math.ceil(totalPosts / limit);
    result.limit = limit;
    result.currentPage = pageNumber;
    res.json({ success: true, message: req.message, result: result });
  }
);

const aggregatedPagination = asyncHandler(
  async (req: Request, res: Response, next: NextFunction) => {
    let { page, limit, ...query } = req.query;
    const parsedPage = parseInt(page?.toString() ?? "1", 25);
    const parsedLimit = parseInt(limit?.toString() ?? "10", 25);

    const responseBody: any = {};
    const model = req.model;
    const filterStages: any[] = req.filterStages ?? [];
    const extraStages = [];
    if (req.aggregatedFilters) {
      req.aggregatedFilters.forEach((filter) => {
        if (filter.val) {
          filterStages.push(
            ...(filter.preExpr ?? []),
            ...(filter.match ? [filter.match] : [])
          );
        } else {
          extraStages.push(...(filter.preExpr ?? []));
        }
      });
    }
    extraStages.push(...(req.extraStages ?? []));
    const queryEntries = Object.entries(query);
    if (queryEntries.length > 0) {
      queryEntries.forEach(([key, val]) => {
        if (isValidObjectId(val)) {
          (query[key] as any) = new mongoose.Types.ObjectId(val?.toString());
        } else if (val == null || val === "null" || val === "undefined") {
          delete query[key];
        } else {
          // query[key] = parseValue(val);
        }
      });
      console.log(JSON.stringify(query));
      filterStages.push({ $match: query });
    }
    const startIndex = (parsedPage - 1) * parsedLimit;
    const result = await model.aggregate([
      ...filterStages,
      {
        $facet: {
          data: [
            {
              $skip: startIndex,
            },
            {
              $limit: parsedLimit,
            },
            ...extraStages,
          ],
          records_count: [
            {
              $count: "count",
            },
          ],
        },
      },
    ]);
    const recordCount =
      result[0].records_count.length > 0 ? result[0].records_count[0].count : 0;
    responseBody.data = result[0].data;
    responseBody.totalCount = recordCount;
    responseBody.totalPages = Math.ceil(recordCount / parsedLimit);
    responseBody.limit = parsedLimit;
    responseBody.currentPage = parsedPage;
    res.json({ success: true, message: req.message, result: responseBody });
  }
);

export { aggregatedPagination, pagination };