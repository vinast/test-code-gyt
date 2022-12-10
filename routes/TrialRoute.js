var express = require("express")
const {getTrials, createTrial, updateTrial, getTrialByUserId} = require("../controllers/Trial.js")
const router = express.Router()

router.get('/trials/:id', getTrialByUserId)
router.post('/trials', createTrial)


module.exports = router;