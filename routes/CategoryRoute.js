
var express = require("express")
const { getCategory, getCategoryById, updateCategory, deleteCategory, createCategory } = require( "../controllers/Category.js");
const { verifyUser, adminOnly } = require( "../middleware/AuthUser.js")
const router = express.Router();

router.get('/category',getCategory);
router.get('/category/:id',getCategoryById);
router.post('/category',createCategory);
router.patch('/category/:id',updateCategory);
router.delete('/category/:id',deleteCategory);

module.exports = router;