const db = require('../db/database');
const oracledb = require('oracledb');
const { Router } = require('express');

oracledb.autoCommit = true




const addUsuario = async (req, res) => {
    let { nombre_usuario, usuario_usuario, foto_usuario_url, contrasena_usuario} = req.body
    var string = contrasena_usuario;
    var crypto = require('crypto');
    var hash = crypto.createHash('md5').update(string).digest('hex');
    console.log(hash + ' hash en base 64');
    let connection
    try {
        connection = await oracledb.getConnection(db)
        let sql = `INSERT INTO usuario(nombre_usuario,usuario_usuario,foto_usuario_url,contrasena_usuario) VALUES('${nombre_usuario}','${usuario_usuario}','${foto_usuario_url}','${hash}') `
        let result = await connection.execute(sql);
        res.send({
            status: 200,
            data: "USUARIO INSERTADO"
        })
    } catch (e) {
        console.error(e)
        res.send({
            status: 400,
            data: e
        })
    }
}
const addUsuariop = async (req, res) => {
    //EXECUTE "REGISTROUSUARIO" ('ARMANDO E','armando','url foto','contrasena hash');
    let { nombre_usuario, usuario_usuario, foto_usuario_url, contrasena_usuario} = req.body
    
    var string = contrasena_usuario;
    var crypto = require('crypto');
    var hash = crypto.createHash('md5').update(string).digest('base64');
    console.log(hash + ' hash en base 64'); 
    
    let data = {
        primero: nombre_usuario,
        segundo: usuario_usuario,
        tercero: foto_usuario_url,
        cuarto: contrasena_usuario

    }
    let connection
    try {
        connection = await oracledb.getConnection(db)
        let sql = `begin "REGISTROUSUARIO"('${req.body.nombre_usuario}','${req.body.usuario_usuario}','${req.body.foto_usuario_url}','${hash}'); end; `
        //let sql = `begin "REGISTROUSUARIO"(:primero,:segundo,:tercero,:cuarto); end; `
        let result = await connection.execute(sql);
        res.send({
            status: 200,
            data: "USUARIO INSERTADO STORED PRO"
        })
    } catch (e) {
        console.error(e)
        res.send({
            status: 400,
            data: e
        })
    }
}

//////////////////// GET's

const getAll = async (req, res) => {
    let connection
    try {
        connection = await oracledb.getConnection(db)
        let sql = 'select * from usuario'
        let result = await connection.execute(sql,[],{ outFormat: oracledb.OUT_FORMAT_OBJECT });
        res.send({
            status: 200,
            data: result.rows
        })
    } catch (e) {
        console.error(e)
        res.send("Error")
    }

}

///////////////////// para log in 
const Login = async (req, res) => {
    console.log(req.body);
//LOGIN ('carmencita','hash contrasena')
//CREATE OR REPLACE FUNCTION "LOGIN" (NUSUARIO IN VARCHAR2, CUSUARIO IN VARCHAR2)
    let {NUSUARIO, CUSUARIO} = req.body
    console.log(req.body.NUSUARIO + ' ESTE VIENE DE LA VISTA');
    var string = CUSUARIO;
    var crypto = require('crypto');
    var hash = crypto.createHash('md5').update(string).digest('base64');
    console.log(hash + ' hash en base 64 que viene del loin'); 

    let connection
    try {
        connection = await oracledb.getConnection(db)
        let sql = `SELECT "LOGIN" ('${req.body.NUSUARIO}','${hash}') FROM DUAL `
        let result = await connection.execute(sql);
        console.log(result.rows[0][0]);
       // if (result.rows[0][0]==NUSUARIO){
        //    console.log('')
        //};
        res.send({
            status: 200,
            data: result.rows
        })
    } catch (e) {
        console.error(e)
        res.send({
            status: 400,
            data: e
        })
    }

}



module.exports = {
    addUsuario,
    addUsuariop,
    getAll,
    Login
}