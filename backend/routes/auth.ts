import Router from 'express';
import { 
    login,
    resgister 
} from '../export';

const router = Router();

router.post('/login', login);
router.post('/register', resgister);

export {
    router as authRouter
}