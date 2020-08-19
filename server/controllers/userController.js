const mysql = require('../db/connection')
// realiza o cadastro do usuário no banco de dados
exports.insert = async(req,res, next)=>{
    try {
        var usuario = req.body.user
        var idade = req.body.idade
        
        if(usuario == '' || idade == ''){
            return res.status(401).send({error:'USUÁRIO NÃO CADASTRADO'})

        }else{
            var result = await mysql.execute('INSERT INTO usuarios(nome,idade) VALUES(?,?)', [usuario, idade])
            return res.status(200).send({response:'USUÁRIO INSERIDO COM SUCESSO'})
        }

       } catch (error) {
           return res.status(500).send({error:'ERRO NA REQUISIÇÃO'})
       }
    

}