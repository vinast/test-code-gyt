var Berlangganan =require ("../models/BerlanggananModel.js")
var Transaksi  =require( "../models/TransaksiModel.js")
var Kelas  =require( "../models/KelasModel.js")
var Users  = require("../models/UserModel.js")
 

 const getLanggananbyUserId = async(req, res)=>{
    try {
        const response = await Berlangganan.findAll({
            // where:{
            //     userId:req.userId
            // },
            attributes:['id', 'userId', 'kelaId', 'transaksiDetailId'],
            include:[
                {   
                    attributes:['id', 'name', 'role'],
                    model: Users
                },
                {   
                    attributes:['id', 'name', 'deskripsi_kelas', "thumbnail_kelas", "thumbnail_url"],
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
            msg:error.message
        })
    }
}


 const getLanggananById = async(req, res)=>{

}


 const createLangganan = async(req, res)=>{
    const{userId,kelaId,transaksiDetailId} = req.body;
    try {
        await Berlangganan.create({
            userId: userId,
            kelaId:kelaId,
            transaksiDetailId: transaksiDetailId,
        })
        res.status(201).json({
            msg:'berhasil'
        })
    } catch (error) {
        res.status(400).json({
            msg:error.message
        })
    }
}


 const updateLangganan = async (req, res)=>{


}


 const deleteLangganan = async (req, res)=>{
    
}

module.exports ={
    deleteLangganan, updateLangganan,
    createLangganan, getLanggananById, getLanggananbyUserId
}