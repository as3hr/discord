import mongoose from "mongoose";
import { IUser } from "../export";

declare module "express-serve-static-core" {
  interface Request {
    model: mongoose.Model<any>;
    modelName: string;
    name: string;
    type: string;
    populate: any;
    prefix: string;
    user: IUser;
    extraStages: mongoose.PipelineStage[];
    status: Record<any, any>;
    updatedQuery: Record<any, any>;
    filterStages: mongoose.PipelineStage[];
    aggregatedFilters: any[];
    message: string;
  }
}

mongoose.SchemaTypes.Boolean.cast(false);
mongoose.SchemaTypes.String.cast(false);
mongoose.SchemaTypes.Number.cast(false);