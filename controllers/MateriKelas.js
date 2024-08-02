var Kelas = require("../models/KelasModel.js");
var Content = require("../models/ContentModel.js");
const { Op } = require("sequelize");

const MateribyKelas = async (req, res) => {
  try {
    const response = await Content.findAll({
      attributes: ["id", "name", "deskripsi_content", "content", "isLocked"],
      include: [
        {
          attributes: [
            "id",
            "name",
            "deskripsi_kelas",
            "thumbnail_kelas",
            "thumbnail_url",
            "harga",
            "categoryId",
          ],
          model: Kelas,
        },
      ],
      order: [
        ["createdAt", "ASC"], // Sorts by COLUMN_NAME_EXAMPLE in ascending order
      ],
      where: {
        kelaId: req.params.id,
      },
    });
    res.status(200).json(response);
  } catch (error) {
    console.log(error);
  }
};
const MateriUnlockedbyKelas = async (req, res) => {
  try {
    const response = await Content.findAll({
      attributes: ["id", "name", "deskripsi_content", "content", "isLocked"],
      include: [
        {
          attributes: [
            "id",
            "name",
            "deskripsi_kelas",
            "thumbnail_kelas",
            "thumbnail_url",
            "harga",
            "categoryId",
          ],
          model: Kelas,
        },
      ],
      order: [
        ["createdAt", "ASC"], // Sorts by COLUMN_NAME_EXAMPLE in ascending order
      ],
      where: {
        kelaId: req.params.id,
        [Op.and]: [{ isLocked: false }],
      },
    });
    res.status(200).json(response);
  } catch (error) {
    console.log(error);
  }
};

const getCountMateriLocked = async (req, res) => {
  try {
    const response = await Content.count({
      where: {
        isLocked: true,
      },
    });
    res.status(200).json(response);
  } catch (error) {
    res.status(500).json({
      message: error.message,
    });
  }
};

const deleteMateri = async (req, res) => {
  const content = await Content.findOne({
    include: [
      {
        model: Kelas,
      },
    ],
    where: {
      id: req.params.id,
    },
  });
  if (!content)
    return res.status(404).json({
      message: "content tidak ditemukan",
    });
  try {
    await Content.destroy({
      where: {
        id: req.params.id,
      },
    });
    res.status(200).json({
      message: "delete berhasil",
    });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

module.exports = {
  deleteMateri,
  MateribyKelas,
  MateriUnlockedbyKelas,
  getCountMateriLocked,
};
