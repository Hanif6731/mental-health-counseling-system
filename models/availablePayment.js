var db = require('./db');

module.exports ={

    get: function(id, callback){
        var sql = "select * from subscription s, subplan sp " +
            "where s.sub_id="+id+" and s.subplan_id=sp.sp_id";
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
        var sql = "select * from subscription s, subplan sp where s.subplan_id=sp.sp_id";
        db.getResults(sql, function(result){
            if(result.length > 0){
                callback(result);
            }else{
                callback([]);
            }
        });
    },

}
