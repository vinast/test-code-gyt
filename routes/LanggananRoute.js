
var express = require("express")
const { getLanggananbyUserId, createLangganan } = require( "../controllers/Berlangganan.js")
const { verifyUser, adminOnly,  } = require( "../middleware/AuthUser.js")
const router = express.Router();

router.get('/langganan', getLanggananbyUserId);
router.post('/langganan', createLangganan)

module.exports = router;