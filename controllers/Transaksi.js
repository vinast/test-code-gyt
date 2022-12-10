
var Transaksi  =require( "../models/TransaksiModel.js")
var Kelas  =require( "../models/KelasModel.js")
var Users  = require("../models/UserModel.js")
var Banks  =require( "../models/BanksModel.js")
var path  =require( "path")
var fs  =require( "fs")
const Validator = require("fastest-validator");
const v = new Validator();

 const getTransaksi = async(req, res)=>{
    try {
        const response = await Transaksi.findAll(
            {
            attributes:['id', 'name', 'status_transaksi', 'tanggal', 'bukti_transaksi', 'bukti_transaksi_url'],
            include:[
                {
                attributes:['id', 'name', 'harga'],
                model: Kelas,
            },{
                attributes:['id', 'name'],
                model: Users
            },
            {   attributes:['id', 'name', 'rekening_no', 'rekening_name'],
                model: Banks
            }]
        });
        res.status(200).json(response)
    } catch (error) {
        res.status(500).json({
            message:error.message
        })
    }
}
const getJumlahTransaksi = async(req, res)=>{
    try {
        const response = await Transaksi.count();
        res.status(200).json(response)
    } catch (error) {
        res.status(500).json({
            message:error.message
        })
    }
}

const getTransaksibyUser = async(req, res)=>{
    try {
        const response = await Transaksi.findAll(
            {
            where:{
                userId: req.params.id 
            },
            attributes:['id', 'name', 'status_transaksi', 'tanggal', 'bukti_transaksi', 'bukti_transaksi_url'],
            include:[
                {
                attributes:['id', 'name', 'harga'],
                model: Kelas
            },{
                attributes:['id', 'name'],
                model: Users
            },
            {   attributes:['id', 'name', 'rekening_name', 'rekening_no'],
                model: Banks
            }]
        });
        res.status(200).json(response)
    } catch (error) {
        res.status(500).json({
            message:error.message
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
        res.status(400).json({
            message:'Transaksi Tidak ditemukan'
        })
    }
}


 const createTransaksi = async(req, res)=>{
    const {name, userId, kelaId, bankId, status_transaksi} = req.body;
    const schema = {
        name: "string",
        userId: "string",
        kelaId: "string",
        bankId: "string",
      };
      const validate = v.validate(req.body, schema);
      if (validate.length) {
        return res.status(400).json(validate);
      }
    try {
        await Transaksi.create({
            name: name,
            status_transaksi: "BELUM SELESAI",
            userId: userId,
            kelaId: kelaId,
            bankId: bankId
        })
        res.status(201).json({
            message:'Transaksi Berhasil'
        })
    } catch (error) {
        res.status(400).json({
            message:'Transaksi Gagal'
        })
    }
}


 const konfirmasiUser = async (req, res)=>{
    const transaksi = await Transaksi.findOne({
        where:{
            id: req.params.id
        }
    })

    if(!transaksi) return res.status(404).json({message:"data tidak ditemukan"});
    let filename;
    
    if(req.file === null || req.file === ""){
        filename = req.files.file.name;
    }else{
        const file = req.files.file;
        const filesize = file.data.length;
        const ext = path.extname(file.name);
        filename = file.md5 + ext;
        const allowedType = ['.png', '.jpg', '.jpeg'];
    
        if(!allowedType.includes(ext.toLowerCase())) return res.status(422).json({message:"invalid image"});
        if(filesize > 5000000) return res.status(422).json({message:"image size must be less than 5 mb"});
      


        if(transaksi.bukti_transaksi){
            const filepath = `./public/bukti_transfer/${transaksi.bukti_transaksi}`;
            fs.unlinkSync(filepath);
        }
            file.mv(`./public/bukti_transfer/${filename}`, (err)=>{
                if(err)return res.status(500).json({message: err.message});
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
        res.status(200).json({message:"Berhasil Mengunggah Bukti Transaksi"})
    } catch (error) {
        res.status(400).json({
            message:'Gagal Mengunggah Bukti Transaksi'
        })
    }
}


 const konfirmasiAdmin = async (req, res)=>{
    const transaksi = await Transaksi.findOne({
        where:{
            id: req.params.id
        }
    })
    if(!transaksi) return res.status(400).json({
        message:"Data tidak ditemukan"
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
            message:'Transaksi Berhasil diKonfirmasi'
        })
    } catch (error) {
        res.status(400).json({
            message:'Transaksi Gagal diKonfirmasi'
        })
    }
}


 const deleteTransaksi = async (req, res)=>{
    const transaksi = await Transaksi.findOne({
        where:{
            id: req.params.id
        }
    });
    if(!transaksi) return res.status(400).json({message:"data tidak ditemukan"})
    try {
        
        if(transaksi.bukti_transaksi !== null){
            const filepath = `./public/bukti_transfer/${transaksi.bukti_transaksi}`;
            fs.unlinkSync(filepath);
        }
        await Transaksi.destroy({
            where:{
                id: req.params.id
            }
        })
        res.status(200).json({message:"data berhasil dihapus"})
    } catch (error) {
        res.status(400).json({
            message:'Transaksi Gagal dihapus'
        })
    }
}


module.exports ={
    deleteTransaksi,
    createTransaksi,
    konfirmasiAdmin,
    konfirmasiUser,
    getTransaksi,
    getTransaksiById,
    getTransaksibyUser,
    getJumlahTransaksi
}