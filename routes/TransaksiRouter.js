
var express = require("express")
const { getTransaksi, deleteTransaksi, konfirmasiAdmin, konfirmasiUser, createTransaksi, getTransaksiById }= require( "../controllers/Transaksi.js")
const { verifyUser, adminOnly }= require( "../middleware/AuthUser.js")
const router = express.Router();

router.get('/transaksi',getTransaksi);
router.post('/transaksi', createTransaksi);
router.get('/transaksi/:id', getTransaksiById);
router.patch('/transaksiadmin/:id', konfirmasiAdmin);
router.patch('/transaksiuser/:id', konfirmasiUser);
router.delete('/transaksi/:id', deleteTransaksi);

module.exports = router;