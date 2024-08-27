import { NextFunction, Request, Response } from "express";
import { asyncHandler,channelModel } from "../export";

export const getChannels = asyncHandler(
    async(req: Request, res: Response, next: NextFunction) => {
        req.modelName = "channels";
        req.model = channelModel;
        next();
    }
);

export const assignChannelModel = asyncHandler(
    async(req: Request, res: Response, next: NextFunction) => {
        req.modelName = "channels";
        req.model = channelModel;
        next();
    }
);