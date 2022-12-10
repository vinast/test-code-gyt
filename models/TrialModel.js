
const Users= require ("./UserModel.js")
const Kelas= require ("./KelasModel.js")
const Sequelize = require( "sequelize")
const db = require( "../config/Database.js")
const {DataTypes} = Sequelize;
const Trial = db.define('trials', {
    id:{
        type: DataTypes.UUID,
        defaultValue: DataTypes.UUIDV4,
        primaryKey: true,
        validate:{
            notEmpty: true
        },
        allowNull: false
    },
    isTrial:{
        type: DataTypes.BOOLEAN,
        validate:{
            notEmpty: true,
        },
        allowNull: false
    }
},{
    freezeTableName:true
})

Users.hasMany(Trial);
Trial.belongsTo(Users, {
    foreignKey: 'userId',
    
})

Kelas.hasMany(Trial);
Trial.belongsTo(Kelas);



module.exports = Trial;