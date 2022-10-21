const Users = require ("../models/UserModel.js")

 const verifyUser = async(req, res, next)=>{
     // jika tidak terdapat session userId
     if(!req.session.userId){
        return res.status(401).json({msg:"mohon login ke akun anda"});
    }
    // jika terdapat session maka mengambil user dari database
    const user = await Users.findOne({
        where:{
            // mencari data user berdasarkan uuid
            id: req.session.userId
        }
    });
    if(!user) return res.status(404).json({msg:"user tidak ditemukan"})
    // jika terdapat user ditemukan maka
    req.userId = user.id;
    req.role = user.role;
    next();    
}

 const adminOnly = async(req, res, next)=>{
   // jika terdapat session maka mengambil user dari database
   const user = await Users.findOne({
       where:{
           // mencari data user berdasarkan uuid
           id: req.session.userId
       }
   });
   if(!user) return res.status(404).json({msg:"user tidak ditemukan"});

//    jika user role bukan admin 
    if(user.role !=="admin")return res.status(403).json({msg:"akses terlarang"});
   next();    
}

module.exports = {
    verifyUser, adminOnly
}