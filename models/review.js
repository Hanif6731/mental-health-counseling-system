var db=require('./db');

module.exports={
    get:function (d_id, callback){
        var sql="SELECT p.name, r.* FROM session s, patient p, review r WHERE s.d_id="+d_id+
            " and s.p_id=p.p_id and r.se_id=s.se_id";
        console.log(sql);
        db.getResults(sql,function (result){
            if(result.length > 0){
                callback(result);
            }else{
                callback([]);
            }
        });
    }
}
