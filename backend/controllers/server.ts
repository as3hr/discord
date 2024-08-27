import { NextFunction, Request, Response } from "express";
import { asyncHandler, serverModel } from "../export";

export const getServers = asyncHandler(
    async(req: Request, res: Response, next: NextFunction) => {
        req.modelName = "servers";
        req.model = serverModel;
        next();
    }
);

export const assignServerModel = asyncHandler(
    async(req: Request, res: Response, next: NextFunction) => {
        req.modelName = "servers";
        req.model = serverModel;
        next();
    }
);