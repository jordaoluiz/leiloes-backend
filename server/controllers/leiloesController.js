const mysql = require('../db/connection')

exports.getAll = async(req,res)=>{
    try {
        var result = await mysql.execute("SELECT * FROM leiloes")
        const response = {
            leiloes:result.map(leilao=>{
               return{
                   id: leilao.id,
                   nome: leilao.nome,
                   valor: leilao.valor,
                   ultimoLance: leilao.ultLance, 
               }
           }) 
       }
           return res.status(200).send(JSON.stringify(response))
   
       } catch (error) {
           return res.status(500).send({error:'ERRO NA REQUISIÇÃO'})
       }
}



exports.getAllLances = async(req,res)=>{
    try {
        var result = await mysql.execute("SELECT * FROM lances")
        const response = {
            lances:result.map(lance=>{
               return{
                   id: lance.id,
                   nome: lance.nome,
                   valor: lance.valorLance,
                   nomeItem: lance.nomeItem, 
               }
           }) 
       }
           return res.status(200).send(JSON.stringify(response))
   
       } catch (error) {
           return res.status(500).send({error:'ERRO NA REQUISIÇÃO'})
       }
}

exports.insert = async(req,res, next)=>{
    try {
        var nome = req.body.nome
        var valor = req.body.valor
        if(nome == '' || valor == ''){
            return res.status(401).send({error:'LEILÃO NÃO CADASTRADO'})
        }

        var result = await mysql.execute('INSERT INTO leiloes(nome,valor) VALUES(?,?)', [nome, valor])
        if(result){
            return res.status(200).send({response:'LEILAO  INSERIDO COM SUCESSO'})
        }
       } catch (error) {
           return res.status(500).send({error:error})
       }
}

exports.darLance = async(req,res, next)=>{

try{
    
    var valorLance = req.body.lance;
    var nome = req.body.nome;
    var idade = req.body.idade;
    var idLeilao = req.body.id;
    var nomeItem = req.body.nomeItem;
    console.log(valorLance,nome,idLeilao,nomeItem)
    var ultimoLance = await mysql.execute('SELECT ultLance FROM leiloes WHERE id = ?', [idLeilao]);
    ultmoLance = ultimoLance[0].ultLance;
    
    if(valorLance > ultmoLance){
        var update = await mysql.execute('UPDATE leiloes SET ultLance =  ? WHERE id = ?', [valorLance, idLeilao]);
        var updateLances = await mysql.execute('INSERT INTO lances (nome, valorLance, nomeItem, idLeilao)VALUES(?,?,?,?)',[nome, valorLance, nomeItem, idLeilao])
        
        
        if(update && updateLances){
            return res.status(200).send(JSON.stringify({response:'LANCE CADASTRADO'}))
        }
    }else{
        return res.status(401).send({error:'LANCE MENOR OU IGUAL O LANCE ATUAL'})

    }
}catch(error){
    return res.status(500).send({error:'ERRO NA REQUISIÇÃO'})

}


}
