const express = require("express");
//const { PrismaClient } = require("@prisma/client");
//const Joi = require("joi");

const router = express.Router();
//const prisma = new PrismaClient();
//const validate = require('../utils/middleware/validate');

router.get('/', (req, res) => {
	res.send("uwu");
});

/*
router.get('/:id', (req, res) => {
	req.params.id
	res.send(`El ID es ${req.params.id}`);
})
*/

module.exports = router;