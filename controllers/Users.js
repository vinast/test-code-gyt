var Users = require("../models/UserModel.js");
var argon2 = require("argon2");
const Validator = require("fastest-validator");
const v = new Validator();
const { Op } = require("sequelize");

const getUsers = async (req, res) => {
  try {
    const response = await Users.findAll({
      // atribut yang ingin ditampilkan di response
      attributes: ["id", "name", "no_telp", "email", "role"],
      where: {
        role: "user",
      },
    });
    res.status(200).json(response);
  } catch (error) {
    res.status(500).json({
      message: error.message,
    });
  }
};

const getJumlahUsers = async (req, res) => {
  try {
    const response = await Users.count({
      where: {
        role: "user",
      },
    });
    res.status(200).json(response);
  } catch (error) {
    res.status(500).json({
      message: error.message,
    });
  }
};

const getUserById = async (req, res) => {
  try {
    const response = await Users.findOne({
      attributes: ["id", "name", "no_telp", "email", "role"],
      where: {
        id: req.params.id,
      },
    });
    res.status(200).json(response);
  } catch (error) {
    res.status(500).json({
      message: error.message,
    });
  }
};

const createUser = async (req, res) => {
  const { name, no_telp, email, password, role } = req.body;
  const schema = {
    name: "string|min:3",
    no_telp: "number|min:10|integer:true",
    email: "email",
    password: "string|min:8",
    role: "string",
  };
  const validate = v.validate(req.body, schema);
  if (validate.length) {
    return res.status(400).json(validate);
  }
  const hashPassword = await argon2.hash(password);

  const emailmatch = await Users.findOne({
    where: {
      email: email,
    },
  });
  try {
    if (!emailmatch) {
      await Users.create({
        name: name,
        no_telp: no_telp,
        email: email,
        password: hashPassword,
        role: role,
      });
    } else {
      return res.status(400).json({ message: "email sudah digunakan" });
    }

    res.status(201).json({
      message: "register berhasil silahkan login",
    });
  } catch (error) {
    res.status(400).json({
      message: error.message,w
    });
  }
};

const updateUser = async (req, res) => {
  const user = await Users.findOne({
    where: {
      id: req.params.id,
    },
  });

  const { name, email, password, no_telp } = req.body;
  const schema = {
    name: "string|min: 3|optional",
    no_telp: "number|min:10|integer:true|optional",
    email: "email|optional",
    password: {
      type: "string",
      optional: true,
    },
  };
  const validate = v.validate(req.body, schema);
  if (validate.length) {
    return res.status(400).json(validate);
  }

  if (!user) return res.status(404).json({ message: "user tidak ditemukan" });
  let hashPassword;
  // jika password tidak diubah
  if (!password) {
    hashPassword = user.password;
  } else {
    // jika password diubah
    hashPassword = await argon2.hash(password);
  }
  const emailmatch = await Users.findOne({
    where: {
      email: email,
      [Op.and]: [
        {
          id: { [Op.not]: req.params.id },
        },
      ],
    },
  });

  if (emailmatch)
    return res.status(400).json({ message: "email sudah digunakan" });

  try {
    await Users.update(
      {
        name: name,
        no_telp: no_telp,
        email: email,
        password: hashPassword,
      },
      {
        where: {
          id: user.id,
        },
      }
    );
    res.status(200).json({
      message: "update berhasil",
    });
  } catch (error) {
    res.status(400).json({
      message: error.message,
    });
  }
};

const deleteUser = async (req, res) => {
  const user = await Users.findOne({
    where: {
      id: req.params.id,
    },
  });
  if (!user) return res.status(404).json({ message: "user tidak ditemukan" });
  try {
    await Users.destroy({
      where: {
        id: user.id,
      },
    });
    res.status(200).json({
      message: "delete berhasil",
    });
  } catch (error) {
    res.status(400).json({
      message: error.message,
    });
  }
};

module.exports = {
  getUserById,
  getUsers,
  updateUser,
  deleteUser,
  createUser,
  getJumlahUsers,
};
