var Users  = require("../models/UserModel.js")
var argon2 = require( "argon2")
const Validator = require("fastest-validator");
const v = new Validator();


 const Login = async(req, res)=>{
    const user = await Users.findOne({
        where:{
            // mencari data berdasarkan email
            email: req.body.email
        }
    });
    if(!user) return res.status(404).json({message:"user tidak ditemukan"})
    // jika user ditemukan maka verfikasi password
    const match = await argon2.verify(user.password, req.body.password);

    // jika password tidak cocok
    if(!match) return res.status(400).json({message:"password salah"});

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
    const {name, email, password, no_telp } = req.body;
    const schema = {
      name: "string|min:3",
      no_telp:"number|min:10|integer:true",
      email: "email",
      password: "string|min:8",
    };
    const validate = v.validate(req.body, schema);
    if (validate.length) {
      return res.status(400).json(validate);
    }
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
                no_telp:no_telp,
                email: email,
                password: hashPassword,
                role: "user"
            });
        }else{
            return res.status(400).json({message:"email sudah digunakan"});
        } 
       
        res.status(201).json({
            message:'register berhasil silahkan login'
        })
    }catch(error){
        res.status(400).json({
            message:error.message
        })
    }
    

}

// get user login
 const Me = async(req, res)=>{
    // jika tidak terdapat session userId
    if(!req.session.userId){
        return res.status(401).json({message:"mohon login ke akun anda"});
    }
    // jika terdapat session maka mengambil user dari database
    const user = await Users.findOne({
        attributes:['id', 'name', 'email', 'role'],
        where:{
            // mencari data user berdasarkan id
            id: req.session.userId
        }
    });
    if(!user) return res.status(404).json({message:"user tidak ditemukan"});

    // jika terdapat user maka akan response
    res.status(200).json(user);
}


 const Logout = async(req, res)=>{
    req.session.destroy((err)=>{
        if(err) return res.status(400).json({message:"tidak dapat logout"});
        res.status(200).json({message:"anda berhasil logout"});
    })
}

module.exports ={
    Me, Login, createUser, Logout
}