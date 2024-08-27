import Router from 'express';
import { 
    checkToken,
    createDocument, 
    deleteDocument, 
    fetchSingleDocument, 
    updateDocument,
    assignServerModel, 
    getServers,
    pagination,
} from '../export';

const router = Router();

router.get('/', checkToken, getServers, pagination);
router.post('/', checkToken, assignServerModel, createDocument);
router.get('/:id', checkToken, assignServerModel, fetchSingleDocument);
router.put('/:id', checkToken, assignServerModel, updateDocument);
router.delete('/:id', checkToken, assignServerModel, deleteDocument);

export {
    router as serverRouter
}