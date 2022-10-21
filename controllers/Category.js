var Categories = require ("../models/CategoriesModel.js")
var Kelas  =require( "../models/KelasModel.js")
 

 const getCategory = async(req, res)=>{
   try {
    const response = await Categories.findAll({
        include:[{
            model: Kelas
        }]
    })
    res.status(200).json(response);
   } catch (error) {
    res.status(500).json({msg:error.message});
   }
   
}


 const getCategoryById = async(req, res)=>{
    try {
        const response = await Categories.findOne({
            where:{
                id: req.params.id
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


 const createCategory = async(req, res)=>{
    const {name,} = req.body;
    try {
        await Categories.create({
            name:name,
        })
        res.status(201).json({
            msg:'category berhasil ditambahkan'
        })
    } catch (error) {
        res.status(400).json({
            msg:error.message
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
        msg:"produk tidak ditemukan"
    });

    try {
        await Categories.update({
            name: req.body.name
        },
        {
            where:{
                id: category.id
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


 const deleteCategory = async (req, res)=>{
    const category = await Categories.findOne({
        where:{
            id: req.params.id
        }
    })
    if(!category)return res.status(404).json({
        msg:"produk tidak ditemukan"
    });
    try {
        await Categories.destroy({
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
    getCategory,
    getCategoryById,
    updateCategory,
    deleteCategory,
    createCategory
}