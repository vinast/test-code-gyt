
const Users= require ("./UserModel.js")
const Kelas= require ("./KelasModel.js")
const Banks= require ("./BanksModel.js")
const Sequelize = require( "sequelize")
const db = require( "../config/Database.js")
const {DataTypes} = Sequelize;
const Transaksi = db.define('transaksi_details', {
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
    tanggal:{
        type: DataTypes.DATE,
        defaultValue: DataTypes.NOW,
        validate:{
            notEmpty: true,
        },
        allowNull: false
    },
    bukti_transaksi:{
        type: DataTypes.TEXT,
        validate:{
            notEmpty: false,
        },
        allowNull: true
    },
    bukti_transaksi_url:{
        type: DataTypes.TEXT,
        validate:{
            notEmpty: false,
        },
        allowNull: true
    },
    status_transaksi:{
        type: DataTypes.STRING,
        validate:{
            notEmpty: true,
        },
        allowNull: false
    },
},{
    freezeTableName:true
})

Users.hasMany(Transaksi);
Transaksi.belongsTo(Users, {
    foreignKey: 'userId'
})

Kelas.hasMany(Transaksi);
Transaksi.belongsTo(Kelas);

Banks.hasMany(Transaksi);
Transaksi.belongsTo(Banks)

// Kelas.belongsToMany(Transaksi);
// Transaksi.belongsTo(Kelas, {
//     foreignKey: 'kelasId'
// })



// Kelas.belongsToMany(Transaksi,{
//     through:'transaksi',
//     foreignKey: 'kelasId'
// })

// Users.belongsToMany(Transaksi,{
//     through:'transaksi',
//     foreignKey: 'userId'
// })

module.exports =Transaksi;