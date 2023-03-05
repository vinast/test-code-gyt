
var express = require("express")
const {MateribyKelas, deleteMateri, getCountMateriLocked, MateriUnlockedbyKelas} = require ("../controllers/MateriKelas.js")
const router = express.Router();
router.get('/materi/:id', MateribyKelas);
router.get('/materifree/:id', MateriUnlockedbyKelas);
router.delete("/materi/:id", deleteMateri);
router.get('/matericount/:id', getCountMateriLocked);

module.exports =router;