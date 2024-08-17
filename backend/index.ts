import { configDotenv } from 'dotenv';
import express from 'express';
import { authRouter } from './export';

configDotenv({path : '.env'});

const app = express();
app.use(express.json());

app.use('/auth', authRouter);

app.listen(5000, ()=>{
    console.log("Server is running on port 5000");
});