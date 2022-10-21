var Kelas  =require( "../models/KelasModel.js")
var Content = require ("../models/ContentModel.js")
 

 const getContent = async(req, res)=>{
    try {
        const response = await Content.findAll({
            include:[{
                model: Kelas
            }]
        })
        res.status(200).json(response);
       } catch (error) {
        res.status(500).json({msg:error.message});
       }
}


 const getContentById = async(req, res)=>{
    try {
        const response = await Content.findAll({
            where:{
                kelaid: req.params.id
            },
            include:[{
                model: Kelas
            }]
        })
        if(!response)return res.status(404).json({
            msg:"produk tidak ditemukan"
        });
        res.status(200).json(response);
    } catch (error) {
        res.status(500).json({msg:error.message});
    }
}


 const createContent = async(req, res)=>{
    const {name,deskripsi_content, content,kelaId } = req.body;
    try {
        await Content.create({
            name: name,
            deskripsi_content: deskripsi_content,
            content: content,
            kelaId: kelaId
        })
        res.status(201).json({msg:"materi ditambahkan"})
    } catch (error) {
        res.status(201).json({msg:error.message})
    }

}


 const updateContent = async (req, res)=>{
}


 const deleteContent = async (req, res)=>{
    const content = await Content.findOne({
        where:{
            id: req.params.id
        }
    })
    if(!content)return res.status(404).json({
        msg:"materi tidak ditemukan"
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
    updateContent,
    deleteContent,
    createContent,
    getContent,
    getContentById
}