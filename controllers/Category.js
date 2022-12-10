var Categories = require ("../models/CategoriesModel.js")
var Kelas  =require( "../models/KelasModel.js")
const Validator = require("fastest-validator");
const v = new Validator();


 const getCategory = async(req, res)=>{
   try {
    const response = await Categories.findAll({
        include:[{
            model: Kelas
        }]
    })
    res.status(200).json(response);
   } catch (error) {
    res.status(500).json({message:error.message});
   }
   
}


 const getCategoryById = async(req, res)=>{
    try {
        const response = await Categories.findAll({
            where:{
                id: req.params.id
            },
            include:[{
                model: Kelas
            }]
        })
        if(!response)return res.status(404).json({
            message:"kelas tidak tersedia"
        });
        res.status(200).json(response);
    } catch (error) {
        res.status(500).json({message:error.message});
    }
}


 const createCategory = async(req, res)=>{
    const {name,} = req.body;
    const schema = {
        name: "string|min:3",
      };

      const validate = v.validate(req.body, schema);
      if (validate.length) {
        return res.status(400).json(validate);
      }
    try {
        await Categories.create({
            name:name,
        })
        res.status(201).json({
            message:'category berhasil ditambahkan'
        })
    } catch (error) {
        res.status(400).json({
            message:error.message
        })
    }

}


 const updateCategory = async (req, res)=>{

    const category = await Categories.findOne({
        where:{
            id: req.params.id
        }
    })
    if(!category)return res.status(404).json({
        message:"category tidak ditemukan"
    });
    const {name  } = req.body;
    const schema = {
        name: "string|min:3",
      };

      const validate = v.validate(req.body, schema);
      if (validate.length) {
        return res.status(400).json(validate);
      }

    try {
        await Categories.update({
            name: name
        },
        {
            where:{
                id: category.id
            }
        });
        res.status(200).json({
            message:'Berhasil me-update '+category.name
        })
    } catch (error) {
        res.status(400).json({
            message:'gagal me-update '+category.name
        })
    }

}


 const deleteCategory = async (req, res)=>{
    const category = await Categories.findOne({
        where:{
            id: req.params.id
        }
    })
    if(!category)return res.status(404).json({
        message:"produk tidak ditemukan"
    });
    try {
        await Categories.destroy({
            where:{
                id: req.params.id
            }
        }); 
        res.status(200).json({
            message:'Berhasil menghapus '+category.name
        });
    } catch (error) {
        res.status(500).json({message:'gagal mengapus '+category.name});
    }
}

module.exports ={
    getCategory,
    getCategoryById,
    updateCategory,
    deleteCategory,
    createCategory
}