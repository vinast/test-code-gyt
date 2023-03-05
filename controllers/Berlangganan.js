const Validator = require("fastest-validator");
const v = new Validator();


var Berlangganan =require ("../models/BerlanggananModel.js")
var Transaksi  =require( "../models/TransaksiModel.js")
var Kelas  =require( "../models/KelasModel.js")
var Users  = require("../models/UserModel.js")

 

 const getLanggananbyUserId = async(req, res)=>{
    try {
        const response = await Berlangganan.findAll({
            where:{
                userId: req.params.id,
            },
            attributes:['id', 'userId', 'kelaId', 'transaksiDetailId'],
            include:[
                {   
                    attributes:['id', 'name',],
                    model: Users
                },
                {   
                    attributes:['id', 'name',  "thumbnail_url", "deskripsi_kelas"],
                    model: Kelas
                },
                {
                    attributes:['id', 'status_transaksi'],
                    model: Transaksi,
                    where:{
                        status_transaksi: "SELESAI"                   
                    }
                },
            ]
        })
        res.status(200).json(response)
    } catch (error) {
        res.status(500).json({
            message:error.message
        })
    }
}

 const createLangganan = async(req, res)=>{
    const{userId,kelaId,transaksiDetailId} = req.body;
    const schema = {
        userId: "string",
        kelaId: "string",
        transaksiDetailId: "string",
      };
      const validate = v.validate(req.body, schema);
      if (validate.length) {
        return res.status(400).json(validate);
      }
    try {
        await Berlangganan.create({
            userId: userId,
            kelaId:kelaId,
            transaksiDetailId: transaksiDetailId,
        })
        res.status(201).json({
            message:'berhasil'
        })
    } catch (error) {
        res.status(400).json({
            message:error.message
        })
    }
}









module.exports ={
    createLangganan, getLanggananbyUserId,
}