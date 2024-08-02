var express = require("express");
const {
  getUserById,
  getUsers,
  createUser,
  updateUser,
  deleteUser,
  getJumlahUsers,
} = require("../controllers/Users.js");
const { verifyUser, adminOnly } = require("../middleware/AuthUser.js");
const router = express.Router();

// dev
router.get("/users", getUsers);
router.get("/users/:id", getUserById);
router.post("/users", createUser);
router.patch("/users/:id", updateUser);
router.delete("/users/:id", deleteUser);
router.get("/userscount", getJumlahUsers);
module.exports = router;





// production
// router.get('/users',verifyUser,adminOnly, getUsers);
// router.get('/users/:id',verifyUser,adminOnly, getUserById);
// router.post('/users',verifyUser,adminOnly, createUser);
// router.patch('/users/:id',verifyUser,adminOnly, updateUser);
// router.delete('/users/:id',verifyUser,adminOnly, deleteUser);
