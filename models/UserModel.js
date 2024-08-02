const { Sequelize } = require("sequelize");
const db = require("../config/Database.js");
const { DataTypes } = Sequelize;
const Users = db.define(
  "users",
  {
    id: {
      type: DataTypes.UUID,
      defaultValue: DataTypes.UUIDV4,
      primaryKey: true,
      validate: {
        notEmpty: true,
      },
      allowNull: false,
    },
    name: {
      type: DataTypes.STRING,
      validate: {
        notEmpty: true,
        len: [3, 35],
      },
      allowNull: false,
    },
    no_telp: {
      type: DataTypes.STRING,
      validate: {
        notEmpty: true,
      },
      allowNull: false,
    },
    email: {
      type: DataTypes.STRING,
      validate: {
        notEmpty: true,
        isEmail: true,
      },
      allowNull: false,
    },
    password: {
      type: DataTypes.STRING,
      validate: {
        notEmpty: true,
      },
      allowNull: false,
    },
    role: {
      type: DataTypes.STRING,
      validate: {
        notEmpty: true,
      },
      allowNull: false,
    },
  },
  {
    freezeTableName: true,
  }
);

module.exports = Users;
