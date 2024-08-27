import { NextFunction, Request, Response } from "express";
import { asyncHandler, HttpError } from "../export";

const createDocument = asyncHandler(
  async (req: Request, res: Response, next: NextFunction) => {
    const result = await req.model.create(req.body);
    if (result) {
      res.json({ success: true, result });
    }
  }
);

const updateDocument = asyncHandler(
  async (req: Request, res: Response, next: NextFunction) => {
    const result = await req.model.findOneAndUpdate(
      { _id: req.params.id, archived: { $ne: true } },
      { $set: req.body },
      { new: true, runValidators: true }
    );
    if (!result) {
      throw HttpError.notFound([req.modelName]);
    }
    res.json({
      success: true,
      result: result,
    });
  }
);

const deleteDocument = asyncHandler(
  async (req: Request, res: Response, next: NextFunction) => {
    const user = await req.model.deleteOne({ _id: req.params.id });
    if (!user) {
      throw HttpError.notFound([req.modelName]);
    }
    res.json({ success: true });
  }
);

const fetchSingleDocument = asyncHandler(
  async (req: Request, res: Response, next: NextFunction) => {
    const result = await req.model
      .findOne({ _id: req.params.id, archived: { $ne: true } })
      .populate(req.populate);
    if (!result) {
      throw HttpError.notFound([req.modelName]);
    }
    res.json({
      success: true,
      result,
    });
  }
);

export { createDocument, deleteDocument, updateDocument, fetchSingleDocument };