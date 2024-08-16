import express, { NextFunction, Response, Request } from 'express';

const app = express();
app.use(express.json());

app.get('/', async (req: Request, res: Response, next: NextFunction) => {
    res.send({message: "INITIAL ROUTE OF THE APPLICATION"});
});

app.listen(5000, ()=>{
    console.log("Server is running on port 5000");
});