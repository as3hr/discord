import { NextFunction, Request, Response } from "express";
import { asyncHandler, messageModel } from "../export";

export const getMessages = asyncHandler(
    async(req: Request, res: Response, next: NextFunction) => {
        req.modelName = "messages";
        req.model = messageModel;
        next();
    }
);

export const assignMessageModel = asyncHandler(
    async(req: Request, res: Response, next: NextFunction) => {
        req.modelName = "messages";
        req.model = messageModel;
        next();
    }
);