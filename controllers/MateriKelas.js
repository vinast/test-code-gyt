var Kelas  =require( "../models/KelasModel.js")
var Content = require ("../models/ContentModel.js")


 const MateribyKelas = async(req, res)=>{
    try {
        const response = await Content.findAll({
            attributes:['id', 'name', 'deskripsi_content', 'content'],
            include:[{
                attributes:['id', 'name', 'deskripsi_kelas', "thumbnail_kelas", "thumbnail_url", "harga", "categoryId"],
                model: Kelas
            }],
            where:{
                kelaId: req.params.id
            }
        })
        res.status(200).json(response);
    } catch (error) {
        console.log(error);
        
    }
}

 const deleteMateri = async(req, res)=>{
    const content = await Content.findOne({
        include:[{
            model: Kelas
        }],
        where:{
            id: req.params.id
        }
    })
    if(!content)return res.status(404).json({
        msg: "content tidak ditemukan"
    });
    try {
        await Content.destroy({
            where:{
                id: req.params.id
            }
        }); 
        res.status(200).json({
            msg:'delete berhasil'
        });
    } catch (error) {
        res.status(500).json({msg:error.message});
    }
}

module.exports ={
    deleteMateri,
    MateribyKelas
}