
var express = require("express")
// import { Login, Logout, Me, createUser } from "../controllers/Auth.js";
const {Login, Logout, Me, createUser} = require("../controllers/Auth.js")
const router = express.Router();

router.get('/me', Me);
router.post('/login', Login);
router.delete('/logout', Logout);
router.post('/register', createUser );

module.exports = router;