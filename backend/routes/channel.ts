import Router from 'express';
import { 
    checkToken,
    assignChannelModel, 
    getChannels,
    pagination,
    createDocument, 
    deleteDocument, 
    fetchSingleDocument, 
    updateDocument 
} from '../export';

const router = Router();

router.get('/', checkToken, getChannels, pagination);
router.post('/', checkToken, assignChannelModel, createDocument);
router.get('/:id', checkToken, assignChannelModel, fetchSingleDocument);
router.put('/:id', checkToken, assignChannelModel, updateDocument);
router.delete('/:id', checkToken, assignChannelModel, deleteDocument);

export {
    router as channelRouter
}