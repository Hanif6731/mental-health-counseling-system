var db=require('./db');

module.exports={
    get:function (id, callback){
        var sql="select * from patient where " +
            "p_id="+id;
        db.getResults(sql,function (result){
            if(result.length > 0){
                callback(result[0]);
            }else{
                callback([]);
            }
        });
    }
}
