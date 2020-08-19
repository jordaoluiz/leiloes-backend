const MYSQL = require('mysql');
var pool = MYSQL.createPool({
    host     : 'localhost',
    user     : 'root',
    password : '',
    database : 'leilao'
});    

exports.pool = pool
exports.execute = (query, params=[])=>{
    return new Promise((resolve,reject)=>{
        pool.getConnection((error,conn)=>{
            if(error){ return reject(error)}
            else{
                conn.query(query,params,(error,result,fields)=>{
                    if(error){reject(error)}
                    else{
                        resolve(result)
                    }
                })
            }
        })
    })
}