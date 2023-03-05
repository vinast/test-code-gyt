
var express = require("express")
const { createLangganan, getLanggananbyUserId} = require( "../controllers/Berlangganan.js")
const { verifyUser, adminOnly,  } = require( "../middleware/AuthUser.js")
const router = express.Router();

router.get('/langganan/:id', getLanggananbyUserId);
router.post('/langganan', createLangganan)


module.exports = router;