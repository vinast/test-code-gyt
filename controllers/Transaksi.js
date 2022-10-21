var Transaksi  =require( "../models/TransaksiModel.js")
var Kelas  =require( "../models/KelasModel.js")
var Users  = require("../models/UserModel.js")
var Banks  =require( "../models/BanksModel.js")
var path  =require( "path")
var fs  =require( "fs")
var argon2  =require( "argon2")

 const getTransaksi = async(req, res)=>{
    try {
        const response = await Transaksi.findAll(
            {
            attributes:['id', 'name', 'status_transaksi', 'tanggal', 'bukti_transaksi', 'bukti_transaksi_url'],
            include:[
                {
                attributes:['id', 'name'],
                model: Kelas
            },{
                attributes:['id', 'name'],
                model: Users
            },
            {   attributes:['id', 'name'],
                model: Banks
            }]
        });
        res.status(200).json(response)
    } catch (error) {
        res.status(500).json({
            msg:error.message
        })
    }
}


 const getTransaksiById = async(req, res)=>{
    try {
        const response = await Kelas.findOne({
            where:{
                id: req.params.id 
            }
        });
        res.json(response)
    } catch (error) {
        console.log(error.message);
    }
}


 const createTransaksi = async(req, res)=>{
    const {name, userId, kelaId, bankId, status_transaksi} = req.body;
    try {
        await Transaksi.create({
            name:name,
            status_transaksi: "BELUM SELESAI",
            userId: userId,
            kelaId: kelaId,
            bankId: bankId
        })
        res.status(201).json({
            msg:'Transaksi Berhasil'
        })
    } catch (error) {
        res.status(400).json({
            msg:error.message
        })
    }
}


 const konfirmasiUser = async (req, res)=>{
    const transaksi = await Transaksi.findOne({
        where:{
            id: req.params.id
        }
    })

    if(!transaksi) return res.status(404).json({msg:"data tidak ditemukan"});
    let filename;
    
    if(req.file === null || req.file === ""){
        filename = req.files.file.name;
    }else{
        const file = req.files.file;
        const filesize = file.data.length;
        const ext = path.extname(file.name);
        filename = file.md5 + ext;
        const allowedType = ['.png', '.jpg', '.jpeg'];
    
        if(!allowedType.includes(ext.toLowerCase())) return res.status(422).json({msg:"invalid image"});
        if(filesize > 5000000) return res.status(422).json({msg:"image size must be less than 5 mb"});
      
        const filepath = `./public/bukti_transfer/${transaksi.bukti_transaksi}`;
        fs.unlinkSync(filepath);

        file.mv(`./public/bukti_transfer/${filename}`, (err)=>{
            if(err)return res.status(500).json({msg: err.message});
        });
       
    }

    const file = req.files.file;
    const bukti_transaksi = req.body.bukti_transaksi;
    const url = `${req.protocol}://${req.get("host")}/bukti_transfer/${filename}`;
    try {


        await Transaksi.update({
            bukti_transaksi: filename,
            bukti_transaksi_url: url
        },{
            where:{
                id: req.params.id
            }
        })
        res.status(200).json({msg:"transaksi berhasil diupdate"})
    } catch (error) {
        console.log(error.message);
    }
}


 const konfirmasiAdmin = async (req, res)=>{
    const transaksi = await Transaksi.findOne({
        where:{
            id: req.params.id
        }
    })
    if(!transaksi) return res.status(400).json({
        msg:"Data tidak ditemuka"
    })
    try {
        await Transaksi.update({
            status_transaksi: req.body.status_transaksi
        },{
            where:{
                id: transaksi.id
            }
        });
        res.status(200).json({
            msg:'update berhasil'
        })
    } catch (error) {
        res.status(400).json({
            msg:error.message
        })
    }
}


 const deleteTransaksi = async (req, res)=>{
    const transaksi = await Transaksi.findOne({
        where:{
            id: req.params.id
        }
    });
    if(!transaksi) return res.status(400).json({msg:"data tidak ditemukan"})
    try {
        const filepath = `./public/bukti_transfer/${transaksi.bukti_transaksi}`;
        fs.unlinkSync(filepath);
        await Transaksi.destroy({
            where:{
                id: req.params.id
            }
        })
        res.status(200).json({msg:"data berhasil dihapus"})
    } catch (error) {
        console.log(error.message);
    }
}


module.exports ={
    deleteTransaksi,
    createTransaksi,
    konfirmasiAdmin,
    konfirmasiUser,
    getTransaksi,
    getTransaksiById
}