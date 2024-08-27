import Router from 'express';
import { checkToken } from '../export';
import { assignServerModel, getServers } from '../controllers/server';
import { pagination } from '../middlewares/pagination';
import { createDocument, deleteDocument, fetchSingleDocument, updateDocument } from '../middlewares/doc_operation';

const router = Router();

router.get('/', checkToken, getServers, pagination);
router.post('/', checkToken, assignServerModel, createDocument);
router.get('/:id', checkToken, assignServerModel, fetchSingleDocument);
router.put('/:id', checkToken, assignServerModel, updateDocument);
router.delete('/:id', checkToken, assignServerModel, deleteDocument);

export {
    router as serverRouter
}