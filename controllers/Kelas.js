var Kelas  =require( "../models/KelasModel.js")
var path  =require( "path")
var fs  =require( "fs")
const Validator = require("fastest-validator");
const v = new Validator();

 const getKelas = async(req, res)=>{
    try {
        const response = await Kelas.findAll();
        res.status(200).json(response)
    } catch (error) {
        res.status(500).json({
            message:error.message
        })
    }
}


 const getKelasById = async(req, res)=>{
    try {
        const response = await Kelas.findOne({
            where:{
                id: req.params.id 
            }
        });
        res.json(response)
    } catch (error) {
    }
}



const getKelasByCategory = async(req, res)=>{
    try {
        if(req.params.id == 'all'){
            const response = await Kelas.findAll();
            res.json(response)
        }else{
            const response = await Kelas.findAll({
                where:{
                    categoryId: req.params.id 
                }
            });
            res.json(response)
        }
    } catch (error) {
    }
}




 const createKelas = (req, res)=>{
    if(req.files === null) return res.status(400).json({message:"no file uploaded"});
    const name = req.body.name;
    const file = req.files.file;
    const deskripsi_kelas = req.body.deskripsi_kelas;
    const harga = req.body.harga;
    const category = req.body.category
    const filesize = file.data.length;
    const ext = path.extname(file.name);
    const filename = file.md5 + ext;
    const url = `${req.protocol}://${req.get("host")}/images/${filename}`;
    const allowedType = ['.png', '.jpg', '.jpeg'];

    if(!allowedType.includes(ext.toLowerCase())) return res.status(422).json({message:"invalid image"});

    if(filesize > 5000000) return res.status(422).json({message:"image size must be less than 5 mb"});

    file.mv(`./public/images/${filename}`, async(err)=>{
        if(err)return res.status(500).json({message: err.message});
        const schema = {
            name: "string",
            deskripsi_kelas: "string",
            harga: "string",
            category: "string",
          };
          const validate = v.validate(req.body, schema);
          if (validate.length) {
            return res.status(400).json(validate);
          }
        try {
            await Kelas.create({
                name:name,
                deskripsi_kelas: deskripsi_kelas,
                thumbnail_kelas:filename,
                thumbnail_url:url,
                harga:harga,
                categoryId:category
            });
            res.status(201).json({message:"kelas berhasil ditambahkan"})
        } catch (error) {
           
        }
    })
}


 const updateKelas = async (req, res)=>{
    const kelas = await Kelas.findOne({
        where:{
            id: req.params.id 
        }
    });

    if(!kelas) return res.status(404).json({message:"data tidak ditemukan"});
    let filename;
    if(!req.files){
        filename = kelas.thumbnail_kelas;
    }else{
        const file = req.files.file;
        const filesize = file.data.length;
        const ext = path.extname(file.name);
        filename = file.md5 + ext;
        const allowedType = ['.png', '.jpg', '.jpeg'];

        if(!allowedType.includes(ext.toLowerCase())) return res.status(422).json({message:"invalid image"});

        if(filesize > 5000000) return res.status(422).json({message:"image size must be less than 5 mb"});
        const filepath = `./public/images/${kelas.thumbnail_kelas}`;
        fs.unlinkSync(filepath);
        
        file.mv(`./public/images/${filename}`, (err)=>{
            if(err)return res.status(500).json({message: err.message});
        });
    }

    const name = req.body.name;
    const deskripsi_kelas = req.body.deskripsi_kelas;
    const harga = req.body.harga;
    const category = req.body.category;
    const url = `${req.protocol}://${req.get("host")}/images/${filename}`;
    const schema = {
        name: "string|optional",
        deskripsi_kelas: "string|optional",
        harga: "string|optional",
        category: "string|optional",
      };
      const validate = v.validate(req.body, schema);
      if (validate.length) {
        return res.status(400).json(validate);
      }
    try {
        await Kelas.update({
            name:name,
            deskripsi_kelas: deskripsi_kelas,
            thumbnail_kelas:filename,
            thumbnail_url:url,
            harga:harga,
            categoryId:category
        },{
            where:{
                id: req.params.id 
            }
        })
        res.status(200).json({message:"kelas berhasil diupdate"})
    } catch (error) {
        res.status(500).json({message: error.message})
    }


}


 const deleteKelas = async (req, res)=>{
    const kelas = await Kelas.findOne({
        where:{
            id: req.params.id 
        }
    });

    if(!kelas) return res.status(404).json({message:"data tidak ditemukan"})
    try {
        const filepath = `./public/images/${kelas.thumbnail_kelas}`;
        fs.unlinkSync(filepath);
        await Kelas.destroy({
            where:{
                id: req.params.id 
            }
        });
        res.status(200).json({message:"kelas berhasil dihapus"})
    } catch (error) {
        res.status(500).json({message: error.message})
    }
}

const getJumlahKelas = async(req, res)=>{
    try {
        const response = await Kelas.count();
        res.status(200).json(response)
    } catch (error) {
        res.status(500).json({
            message:error.message
        })
    }
}

module.exports ={
    createKelas, updateKelas,
    deleteKelas, getKelas, getKelasById,
    getJumlahKelas, getKelasByCategory
}