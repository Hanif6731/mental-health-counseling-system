var db = require('./db');

module.exports ={

    get: function(id, callback){
        var sql = "select * from session where se_id="+id;
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
        var sql = "select * from session";
        db.getResults(sql, function(result){
            if(result.length > 0){
                callback(result);
            }else{
                callback([]);
            }
        });
    },


    insert: function(session, callback){
        var sql = "insert into session (date, p_id, d_id, path) " +
            "values(current_timestamp, "+session.patient_id+", "+session.d_id+","+session.path+")";

        console.log(sql);

        db.execute(sql, function(status){
            if(status){
                callback(true);
            }else{
                callback(false);
            }
        });
    },

}
