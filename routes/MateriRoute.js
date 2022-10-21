
var express = require("express")
const {MateribyKelas, deleteMateri} = require ("../controllers/MateriKelas.js")
const router = express.Router();
router.get('/materi/:id', MateribyKelas);
router.delete("/materi/:id", deleteMateri)
module.exports =router;