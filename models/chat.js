var db = require('./db');

module.exports ={

    get: function(id, callback){
        var sql = "select * from chat where id="+id;
        db.getResults(sql, function(result){
            if(result.length > 0){
                console.log(result[0]);
                callback(result[0]);
            }else{
                callback([]);
            }
        });
    },

    getAll: function(callback){
        var sql = "select * from chat where receiver is null sort by ch_id desc ";
        db.getResults(sql, function(result){
            if(result.length > 0){
                callback(result);
            }else{
                callback([]);
            }
        });
    },

    insert: function(chat, callback){
        var sql = "insert into chat (msg, sender, Reciever) " +
            "values('"+chat.message+"', "+chat.sender+", "+chat.receiver+")";

        console.log(sql);

        db.execute(sql, function(status){
            if(status){
                callback(true);
            }else{
                callback(false);
            }
        });
    }


}
