var Users  = require("../models/UserModel.js")
var argon2 = require( "argon2")

 const getUsers = async(req, res)=>{
    try{
        const response = await Users.findAll({
            // atribut yang ingin ditampilkan di response
            attributes:['id', 'name', 'email', 'role'],
            where:{
                role:"user"
            }
        });
        res.status(200).json(response);
    }catch(error){
        res.status(500).json({
            msg:error.message
        })
    }
}


 const getUserById = async(req, res)=>{
    try{
        const response = await Users.findOne({
            attributes:['id', 'name', 'email', 'role'],
            where:{
                id: req.params.id
            }
        });
        res.status(200).json(response);
    }catch(error){
        res.status(500).json({
            msg:error.message
        })
    }
}


 const createUser = async(req, res)=>{
    const {name, email, password,  role} = req.body;
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
        }else{
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


 const updateUser = async (req, res)=>{
    const user = await Users.findOne({
        where:{
            id: req.params.id
        }
    });
    const emailmatch = await Users.findOne({
        where:{
            email: email
        }
     })
    if(!user) return res.status(404).json({msg:"user tidak ditemukan"})
    const {name, email, password,  role} = req.body;
    let hashPassword;
    // jika password tidak diubah
    if(password ==="" || password===null){
        hashPassword = user.password
    }else{
        // jika password diubah
        hashPassword = await argon2.hash(password)
    }

    try{
        if(!emailmatch){
            await Users.update({
                name: name,
                email: email,
                password: hashPassword,
                role: role
            }, {
                where:{
                    id: user.id
                }
            });
        }else{
            return res.status(400).json({msg:"update gagal, email sudah digunakan"});
        } 
        res.status(200).json({
            msg:'update berhasil'
        })
    }catch(error){
        res.status(400).json({
            msg:error.message
        })
    }

}


 const deleteUser = async (req, res)=>{
    const user = await Users.findOne({
        where:{
            id: req.params.id
        }
    });
    if(!user) return res.status(404).json({msg:"user tidak ditemukan"});
    try{
        await Users.destroy({
            where:{
                id: user.id
            }
        });
        res.status(200).json({
            msg:'delete berhasil'
        })
    }catch(error){
        res.status(400).json({
            msg:error.message
        })
    }
}

module.exports ={ getUserById, getUsers, updateUser, deleteUser, createUser}