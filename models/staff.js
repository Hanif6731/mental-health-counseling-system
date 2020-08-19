var db=require('./db');

module.exports={
    get:function (id, callback){
        var sql="select * from staff where user_id="+id;
        db.getResults(sql,function (result){
            if(result.length > 0){
                callback(result);
            }else{
                callback([]);
            }
        });
    },
    getAll:function (callback){
        var sql="select * from staff";
        db.getResults(sql,function (result){
            if(result.length > 0){
                callback(result);
            }else{
                callback([]);
            }
        });
    },
    insert: function(staff, callback){
        var sql = "INSERT INTO `staff`( `name`, `email`, `phone`, `user_id`) VALUES ('"+staff.name+"','"+staff.email+"','"+staff.phone+"',"+staff.user_id+")";

        console.log(sql);

        db.execute(sql, function(status){
            if(status){
                callback(true);
            }else{
                callback(false);
            }
        });
    },

    update: function(staff, callback){
        var sql = "UPDATE `staff` SET `name`='"+staff.name+"',`email`='"+staff.email+"',`phone`='"+staff.name+"' WHERE user_id="+staff.user_id;
        db.execute(sql, function(status){
            if(status){
                callback(true);
            }else{
                callback(false);
            }
        });
    },
    delete: function(id, callback){
        var sql = "delete from staff where id="+id;
        db.execute(sql, function(status){
            if(status){
                callback(true);
            }else{
                callback(false);
            }
        });
    }
}
