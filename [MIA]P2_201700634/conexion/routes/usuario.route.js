const { Router } = require('express');
const {addUsuario,addUsuariop,getAll} = require('../controllers/usuario.controller')
const router = Router()
router.get('/getAll',getAll)
router.post('/addUsuario',addUsuario)
router.post('/addUsuariop',addUsuariop)


module.exports = router