const Sequelize = require( "sequelize")
const db = require( "../config/Database.js")

const Users= require ("./UserModel.js")
const Kelas= require ("./KelasModel.js")
const Transaksi = require ("./TransaksiModel.js")
const {DataTypes} = Sequelize;
const Berlangganan = db.define('langganan',{
    id:{
        type: DataTypes.UUID,
        defaultValue: DataTypes.UUIDV4,
        primaryKey: true,
        validate:{
            notEmpty: true
        },
        allowNull: false
    },
},{
    freezeTableName:true
})

Users.hasMany(Berlangganan);
Berlangganan.belongsTo(Users, {
    foreignKey: 'userId'
})

Kelas.hasMany(Berlangganan);
Berlangganan.belongsTo(Kelas);

Transaksi.hasMany(Berlangganan);
Berlangganan.belongsTo(Transaksi)
module.exports = Berlangganan;