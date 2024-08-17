import { NextFunction, Response, Request } from 'express';
import  Jwt, { JwtPayload }  from "jsonwebtoken";
import { asyncHandler } from "../export";

export const checkToken = asyncHandler(
    async(req: Request,res: Response, next: NextFunction) => {
        const token = req.headers?.authorization?.split('Bearer ')[1];
        if(token){
            const decodedToken = Jwt.verify(token, process.env.TOKEN_SECRET!) as JwtPayload;
            if(decodedToken){
                next();
            }else{
                res.status(401).json({message: 'Unauthorized'});
            }
        }else{
            res.status(401).json({message: 'Unauthorized'});
        }
});