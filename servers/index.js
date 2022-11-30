const express=require("express");
const mongoose=require("mongoose");
const authrouter = require("./router/auth");
const favoriteRoute = require("./router/favorite");
const moviesRouter = require("./router/movies");
const PORT=3000;
const app =express();

app.use(express.json());
app.use(authrouter);
app.use(moviesRouter);
app.use(favoriteRoute);


let db="mongodb+srv://yunishpandit:yunishhello1234@cluster0.wwyuaak.mongodb.net/?retryWrites=true&w=majority";
console.log("Hello everyone");
mongoose.connect(db).then(()=>{
    console.log("Conected successfully")
}).catch((e)=>{
    console.log(e);
});
app.listen(PORT,"0.0.0.0",()=>{
    console.log("Connected to "+PORT);
})