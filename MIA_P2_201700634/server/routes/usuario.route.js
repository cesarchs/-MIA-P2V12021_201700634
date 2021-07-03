const { Router } = require('express');
const {addUsuario,addUsuariop,getAll,Login} = require('../controllers/usuario.controller')
const router = Router()
router.get('/getAll',getAll)
router.post('/addUsuario',addUsuario)
router.post('/addUsuariop',addUsuariop)
router.post('/Login',Login)


module.exports = router