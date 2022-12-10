var Trial = require("../models/TrialModel.js")
const Validator = require("fastest-validator");
const v = new Validator();
const {Op} = require("sequelize");
var Kelas = require( "../models/KelasModel.js");


const getTrials = async(req, res)=>{
    try {
        
    } catch (error) {
        
    }
}

const getTrialByUserId = async(req, res)=>{
    try {
        const response = await Trial.findAll({
            where:{
                userId: req.params.id
            },
            include:[{
                model: Kelas
            }]
        })
        if(!response)return res.status(404).json({
            message:"trial tidak ditemukan"
        });
        res.status(200).json(response);
    } catch (error) {
        res.status(500).json({message:error.message});
    }
}

const createTrial = async(req, res)=>{
    const {isTrial, userId, kelaId} = req.body;
    const schema = {
        isTrial:"boolean"
    };
    const validate = v.validate(req.body, schema);
    if(validate.length){
        return res.status(400).json(validate)
    }
    try {
        await Trial.create({
            isTrial: isTrial,
            userId: userId,
            kelaId: kelaId
        })
        res.status(201).json({message:"berhasil mendaftar trial"})
    } catch (error) {
        res.status(400).json({message:error.message})
    }
}

const updateTrial = async(req, res)=>{

}

const deleteTrial = async(req, res)=>{

}


module.exports ={getTrials, getTrialByUserId, createTrial, updateTrial, deleteTrial};