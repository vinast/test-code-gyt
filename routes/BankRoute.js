
var express = require("express")
const{ getBank, createBank, getBankById, updateBank, deleteBank } = require("../controllers/Banks.js")

const { verifyUser, adminOnly }  = require("../middleware/AuthUser.js")
const router = express.Router();

router.get('/banks',getBank);
router.get('/banks/:id',getBankById);
router.post('/banks', createBank);
router.patch('/banks/:id', updateBank);
router.delete('/banks/:id', deleteBank);

module.exports = router;