var express = require('express')
var cors = require ( "cors")
var cookieParser = require( "cookie-parser")
var session = require( "express-session")
var FileUpload = require( "express-fileupload")
var UserRoute = require ('./routes/UserRoute.js')
var AuthRoute = require ('./routes/AuthRoute.js')
var TransaksiRoute = require ('./routes/TransaksiRouter.js')
var LanggananRoute = require ('./routes/LanggananRoute.js')
var KelasRoute = require ('./routes/KelasRoute.js')
var ContentRoute = require ('./routes/ContentRoute.js')
var CategoryRoute = require ('./routes/CategoryRoute.js')
var MateriRoute = require ("./routes/MateriRoute.js")
var BankRoute = require ("./routes/BankRoute.js")
var SequelizeStore = require ("connect-session-sequelize")
var db = require ("./config/Database.js")
require('dotenv').config()


const app = express();

const sessionStore = SequelizeStore(session.Store);

const store = new sessionStore({
    db: db
});
const oneDay = 1000 * 60 * 60 * 24;

// (async()=>{
//     await db.sync();
// })();
app.use(session({
    secret:process.env.SESS_SECRET,
    resave: false,
    saveUninitialized: true,
    store: store,
    cookie:{
        maxAge: oneDay,
        secure: false,
        // secure: true,
        sameSite: "lax",
        // sameSite: "none",
        httpOnly: true,
    }
}))

app.enable('trust proxy');

app.use(function(req, res, next) {
    res.header('Access-Control-Allow-Credentials', true);
    res.header('Access-Control-Allow-Origin', req.headers.origin);
    res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE');
    res.header('Access-Control-Allow-Headers', 'X-Requested-With, X-HTTP-Method-Override, Content-Type, Accept');
    next();
});
app.use(cors({
    credentials: true,
    origin: ['http://127.0.0.1:5173', 'http://localhost:3000']
}))

app.use(express.json());
app.use(FileUpload())
app.use(express.static("public"));
app.use(cookieParser());
app.use(UserRoute)
app.use(AuthRoute);
app.use(TransaksiRoute)
app.use(KelasRoute);
app.use(ContentRoute);
app.use(LanggananRoute);
app.use(CategoryRoute);
app.use(MateriRoute);
app.use(BankRoute)
// store.sync();


app.listen(process.env.PORT || 3000, ()=>{
    console.log("server terhubung");
})

// db password : hARhJ~3fn+oA
// User: khalxxxd_fakiuad
// Database: khalxxxd_web_kids