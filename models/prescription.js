var db = require('./db');

module.exports ={

    get: function(id, callback){
        var sql = "select * from prescription where pr_id="+id;
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
        var sql = "select * from prescription";
        db.getResults(sql, function(result){
            if(result.length > 0){
                callback(result);
            }else{
                callback([]);
            }
        });
    },


    insert: function(prescription, callback){
        var sql = "insert into prescription (`name`, `qty`, `type`, `duration`, `timing`, `notes`, `p_id`, `d_id`) " +
            "values('"+prescription.medicine+"', "+prescription.quantity+",'"+prescription.type+"',"+prescription.duration+"," +
            "'"+prescription.timing+"','"+prescription.notes+"',"+prescription.p_id+","+prescription.d_id+")";

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
