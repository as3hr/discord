import  Jwt from "jsonwebtoken";
import { NextFunction, Response, Request } from 'express';
import { asyncHandler, userModel } from '../export';

export const login = asyncHandler( 
    async (req: Request,res: Response, next: NextFunction) => {
    const { email, password } = req.body;
    if(!email && !password){
        return res.status(400).json({message: "Please provide email and password"});
    }
    const user = await userModel.findOne({email: email});
    if(user && await user.comparePassword(user.password!)){
        const token = generateToken(1);
        res.send({
            token: token,
            result: user,
        });
    }else{
        return res.status(401).json({message: "Incorrect credentials"});
    }
});

export const resgister = asyncHandler( 
    async (req: Request,res: Response, next: NextFunction) => {
     if(!req.body.first_name || !req.body.email || !req.body.password){
        return res.status(400).json({message: "Name, email or password is missing!"});
     }
     const user = await userModel.create(req.body);
     const token = generateToken(1);
     res.send({
        token: token,
        result: user,
     });
});

const generateToken = (userId: number) => {
    const token = Jwt.sign({ userId }, process.env.JWT_SECRET!);
    return token;
}