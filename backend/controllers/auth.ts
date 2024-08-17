import  Jwt from "jsonwebtoken";
import { NextFunction, Response, Request } from 'express';
import { asyncHandler } from '../export';

export const login = asyncHandler( 
    async (req: Request,res: Response, next: NextFunction) => {
    const token = generateToken(1);
});

export const resgister = asyncHandler( 
    async (req: Request,res: Response, next: NextFunction) => {
        
});

const generateToken = (userId: number) => {
    const token = Jwt.sign({ userId }, process.env.JWT_SECRET!);
    return token;
}