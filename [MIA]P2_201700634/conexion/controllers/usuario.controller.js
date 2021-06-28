const db = require('../db/database')
const oracledb = require('oracledb');
oracledb.autoCommit = true
const add = async (req, res) => {
    let { nombre, apellido } = req.body
    let data = {
        first: nombre,
        second: apellido
    }
    let connection
    try {
        connection = await oracledb.getConnection(db)
        let sql = `insert into usuario(first_name,last_name) VALUES('${nombre}','${apellido}') `
        let result = await connection.execute(sql);
        res.send({
            status: 200,
            data: "Insertado uwu"
        })
    } catch (e) {
        console.error(e)
        res.send({
            status: 400,
            data: e
        })
    }

}


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



module.exports = {
    add,
    getAll
}