var Users  = require("../models/UserModel.js")
var argon2 = require( "argon2")


 const Login = async(req, res)=>{
    const user = await Users.findOne({
        where:{
            // mencari data berdasarkan email
            email: req.body.email
        }
    });
    if(!user) return res.status(404).json({msg:"user tidak ditemukan"})

    // jika user ditemukan maka verfikasi password
    const match = await argon2.verify(user.password, req.body.password);

    // jika password tidak cocok
    if(!match) return res.status(400).json({msg:"password salah"});

    // jika password cocok maka set session
    req.session.userId = user.id;
    // response
    const id = user.id;
    const name = user.name;
    const email = user.email;
    const role = user.role;
    res.status(200).json({id, name, email, role});
    
}

 const createUser = async(req, res)=>{
    const {name, email, password,} = req.body;
     const hashPassword = await argon2.hash(password);
     const emailmatch = await Users.findOne({
        where:{
            email: email
        }
     })
    try{
        if(!emailmatch){
            await Users.create({
                name: name,
                email: email,
                password: hashPassword,
                role: "user"
            });
            console.log("terbuat");
        }else{
            console.log("tergagalkan");

            return res.status(400).json({msg:"email sudah digunakan"});
        } 
       
        res.status(201).json({
            msg:'register berhasil silahkan login'
        })
    }catch(error){
        res.status(400).json({
            msg:error.message
        })
    }
    

}

// get user login
 const Me = async(req, res)=>{
    // jika tidak terdapat session userId
    if(!req.session.userId){
        return res.status(401).json({msg:"mohon login ke akun anda"});
    }
    // jika terdapat session maka mengambil user dari database
    const user = await Users.findOne({
        attributes:['id', 'name', 'email', 'role'],
        where:{
            // mencari data user berdasarkan id
            id: req.session.userId
        }
    });
    if(!user) return res.status(404).json({msg:"user tidak ditemukan"});

    // jika terdapat user maka akan response
    console.log(req.session)
    res.status(200).json(user);
}


 const Logout = async(req, res)=>{
    req.session.destroy((err)=>{
        if(err) return res.status(400).json({msg:"tidak dapat logout"});
        console.log(req.session)
        res.status(200).json({msg:"anda berhasil logout"});
    })
}

module.exports ={
    Me, Login, createUser, Logout
}