import Router from 'express';
import { checkToken } from '../export';
import { assignChannelModel, getChannels } from '../controllers/channel';
import { pagination } from '../middlewares/pagination';
import { createDocument, deleteDocument, fetchSingleDocument, updateDocument } from '../middlewares/doc_operation';

const router = Router();

router.get('/', checkToken, getChannels, pagination);
router.post('/', checkToken, assignChannelModel, createDocument);
router.get('/:id', checkToken, assignChannelModel, fetchSingleDocument);
router.put('/:id', checkToken, assignChannelModel, updateDocument);
router.delete('/:id', checkToken, assignChannelModel, deleteDocument);

export {
    router as serverRouter
}