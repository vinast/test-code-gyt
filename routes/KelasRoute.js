
var express = require("express")
const { getKelas, createKelas, getKelasById, updateKelas, deleteKelas,getJumlahKelas, getKelasByCategory }= require( "../controllers/Kelas.js")
const { verifyUser, adminOnly }= require( "../middleware/AuthUser.js")
const router = express.Router();

router.get('/kelas',getKelas);
router.post('/kelas', createKelas);
router.get('/kelas/:id',getKelasById);
router.patch('/kelas/:id', updateKelas);
router.delete('/kelas/:id',deleteKelas);
router.get('/kelascount',getJumlahKelas);
router.get('/kelas/category/:id', getKelasByCategory)



module.exports = router;