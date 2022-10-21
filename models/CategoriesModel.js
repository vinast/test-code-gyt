const {Sequelize} = require( "sequelize")
const db = require( "../config/Database.js")
const Kelas= require ("./KelasModel.js")
const {DataTypes} = Sequelize;
const Categories = db.define('categories',{
    id:{
        type: DataTypes.UUID,
        defaultValue: DataTypes.UUIDV4,
        primaryKey: true,
        validate:{
            notEmpty: true
        },
        allowNull: false
    },
    name:{
        type: DataTypes.STRING,
        validate:{
            notEmpty: true,
        },
        allowNull: false
    },
    
},{
    freezeTableName:true
})


module.exports = Categories;