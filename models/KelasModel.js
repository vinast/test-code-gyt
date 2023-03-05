const {Sequelize} = require( "sequelize")
const db = require( "../config/Database.js")
const Categories = require ("./CategoriesModel.js")
const {DataTypes} = Sequelize;
const Kelas = db.define('kelas',{
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
    deskripsi_kelas:{
        type: DataTypes.TEXT('long'),
        validate:{
            notEmpty: true,
        },
        allowNull: false
    },
    thumbnail_kelas:{
        type: DataTypes.STRING,
        validate:{
            notEmpty: false,
        },
        allowNull: true
    },
    thumbnail_url:{
        type: DataTypes.STRING,
        validate:{
            notEmpty: false,
        },
        allowNull: true
    },
    harga:{
        type: DataTypes.INTEGER,
        validate:{
            notEmpty: true,
        },
        allowNull: false
    }
},{
    freezeTableName:true
})

Categories.hasMany(Kelas);
Kelas.belongsTo(Categories);


module.exports = Kelas;