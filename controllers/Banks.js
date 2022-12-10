const Validator = require("fastest-validator");
const v = new Validator();
var Banks = require ("../models/BanksModel.js")
 const getBank = async(req, res)=>{
    try {
        const response = await Banks.findAll()
        res.status(200).json(response);
       } catch (error) {
        res.status(500).json({message:error.message});
       }
}


 const getBankById = async(req, res)=>{
    try {
        const response = await Banks.findOne({
            where:{
                id: req.params.id
            },
        })
        if(!response)return res.status(404).json({
            message:"produk tidak ditemukan"
        });
        res.status(200).json(response);
    } catch (error) {
        res.status(500).json({message:error.message});
    }
}


 const createBank = async(req, res)=>{
    const {name, rekening_name, rekening_no  } = req.body;
    const schema = {
        name: "string|min:3",
        rekening_name:"string|min:3",
        rekening_no:"string|min:8"
      };

      const validate = v.validate(req.body, schema);
      if (validate.length) {
        return res.status(400).json(validate);
      }
    try {
        await Banks.create({
            name:name,
            rekening_name:rekening_name,
            rekening_no:rekening_no
        })
        res.status(201).json({
            message:'Bank berhasil ditambahkan'
        })
    } catch (error) {
        res.status(400).json({
            message:error.message
        })
    }
}


 const updateBank = async (req, res)=>{
    const bank = await Banks.findOne({
        where:{
            id: req.params.id
        }
    })
    if(!bank)return res.status(404).json({
        message:"Data tidak ditemukan"
    });

    const {name,rekening_name, rekening_no } = req.body;
    const schema = {
        name: "string|min:3|optional",
        rekening_name:"string|min:3|optional",
        rekening_no:"string|min:8|optional"
      };

      const validate = v.validate(req.body, schema);
      if (validate.length) {
        return res.status(400).json(validate);
      }

    try {
        await Banks.update({
            name: name,
            rekening_name:rekening_name,
            rekening_no:rekening_no
        },
        {
            where:{
                id: bank.id
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


 const deleteBank = async (req, res)=>{
    const bank = await Banks.findOne({
        where:{
            id: req.params.id
        }
    })
    if(!bank)return res.status(404).json({
        message:"data tidak ditemukan"
    });
    try {
        await Banks.destroy({
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

const getJumlahBank = async(req, res)=>{
    try {
        const response = await Banks.count();
        res.status(200).json(response)
    } catch (error) {
        res.status(500).json({
            message:error.message
        })
    }
}

module.exports = {
    updateBank, deleteBank, createBank, getBankById, getBank, getJumlahBank
}