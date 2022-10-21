var Banks = require ("../models/BanksModel.js")
 

 const getBank = async(req, res)=>{
    try {
        const response = await Banks.findAll()
        res.status(200).json(response);
       } catch (error) {
        res.status(500).json({msg:error.message});
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
            msg:"produk tidak ditemukan"
        });
        res.status(200).json(response);
    } catch (error) {
        res.status(500).json({msg:error.message});
    }
}


 const createBank = async(req, res)=>{
    const {name,} = req.body;
    try {
        await Banks.create({
            name:name,
        })
        res.status(201).json({
            msg:'Bank berhasil ditambahkan'
        })
    } catch (error) {
        res.status(400).json({
            msg:error.message
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
        msg:"Data tidak ditemukan"
    });

    try {
        await Banks.update({
            name: req.body.name
        },
        {
            where:{
                id: bank.id
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


 const deleteBank = async (req, res)=>{
    const bank = await Banks.findOne({
        where:{
            id: req.params.id
        }
    })
    if(!bank)return res.status(404).json({
        msg:"data tidak ditemukan"
    });
    try {
        await Banks.destroy({
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

module.exports = {
    updateBank, deleteBank, createBank, getBankById, getBank
}