const { Router } = require('express');
const {add,getAll} = require('../controllers/usuario.controller')
const router = Router()
router.get('/getAll',getAll)
router.post('/add',add)

module.exports = router