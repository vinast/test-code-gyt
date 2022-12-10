var Kelas  =require( "../models/KelasModel.js")
var Content = require ("../models/ContentModel.js")
const {Op} = require("sequelize")
const Validator = require("fastest-validator");
const v = new Validator();

 const getContent = async(req, res)=>{
    try {
        const response = await Content.findAll({
            include:[{
                model: Kelas
            }]
        })
        res.status(200).json(response);
       } catch (error) {
        res.status(500).json({message:error.message});
       }
}


 const getContentByIdKelas = async(req, res)=>{
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
            message:"content tidak ditemukan"
        });
        res.status(200).json(response);
    } catch (error) {
        res.status(500).json({message:error.message});
    }
}

const getContentById = async(req, res)=>{
    try {
        const response = await Content.findOne({
            where:{
                id: req.params.id
            },
  
        })
        if(!response)return res.status(404).json({
            message:"data tidak ditemukan"
        });
        res.status(200).json(response);
    } catch (error) {
        res.status(500).json({message:error.message});
    }
}


 const createContent = async(req, res)=>{
    const {name,deskripsi_content, content,kelaId } = req.body;
    const schema = {
        name: "string|min:4",
        deskripsi_content: "string",
        content: "string",
        kelaId: "string",
      };
      const validate = v.validate(req.body, schema);
      if (validate.length) {
        return res.status(400).json(validate);
      }
    try {
        await Content.create({
            name: name,
            deskripsi_content: deskripsi_content,
            content: content,
            kelaId: kelaId
        })
        res.status(201).json({message:"materi ditambahkan"})
    } catch (error) {
        res.status(400).json({message:error.message})
    }

}


 const updateContent = async (req, res)=>{
    const response = await Content.findOne({
        where:{
            id: req.params.id
        }
    })
    if(!response)return res.status(404).json({
        message:"data tidak ditemukan"
    });
    const {name,deskripsi_content, content,  } = req.body;
    const schema = {
        name: "string|min:3|optional",
        deskripsi_content: "string|optional",
        content: "string|optional",
      };

      const validate = v.validate(req.body, schema);
      if (validate.length) {
        return res.status(400).json(validate);
      }

    try {
        await Content.update({
            name: name,
            deskripsi_content: deskripsi_content,
            content: content,
        },
        {
            where:{
                id: response.id
            }
        });
        res.status(200).json({
            message:'update berhasil'
        })
    } catch (error) {
        res.status(400).json({
            message:error.message
        })
    }

}


 const deleteContent = async (req, res)=>{
    const content = await Content.findOne({
        where:{
            id: req.params.id
        }
    })
    if(!content)return res.status(404).json({
        message:"materi tidak ditemukan"
    });
    try {
        await Content.destroy({
            where:{
                id: req.params.id
            }
        }); 
        res.status(200).json({
            message:'delete berhasil'
        });
    } catch (error) {
        res.status(500).json({message:error.message});
    }
}

module.exports ={
    updateContent,
    deleteContent,
    createContent,
    getContent,
    getContentByIdKelas,
    getContentById
}