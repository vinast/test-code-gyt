
var express = require("express")
const { getContent, createContent, getContentById, deleteContent } = require( "../controllers/Content.js")
const { verifyUser, adminOnly } = require( "../middleware/AuthUser.js")
const router = express.Router();

router.get('/content/:id',getContentById);
router.post('/content', createContent);
router.get('/content', getContent);
router.delete('/content/:id', getContent);
module.exports = router;