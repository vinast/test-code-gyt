const Sequelize = require( "sequelize")
const db = require( "../config/Database.js")
const Kelas= require ("./KelasModel.js")
const {DataTypes} = Sequelize;
const Content = db.define('contents',{
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
    deskripsi_content:{
        type: DataTypes.TEXT('long'),
        validate:{
            notEmpty: true,
        },
        allowNull: false
    },
    content:{
        type: DataTypes.STRING,
        validate:{
            notEmpty: true,
        },
        allowNull: false
    },
    isLocked:{
        type: DataTypes.BOOLEAN,
        validate:{
            notEmpty: true,
        },
        allowNull: false
    },
},{
    freezeTableName:true
})

Kelas.hasMany(Content);
Content.belongsTo(Kelas);



module.exports = Content;