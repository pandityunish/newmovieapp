const express=require("express");
const User = require("../model/user");

const authrouter=express.Router();


authrouter.post("/api/sigin",async(req,res)=>{
    try{
     const{name,email,password}=req.body;
     let existinguser=await User.findOne({email});
     if(existinguser){
        return res.status(400).json({mes:"This email is already register"})
     }
     
     let user=await User({
        name,
        email,
        password
     });
     user=await user.save();
     res.json(user);
    }catch(e){
        res.status(500).json({mes:e.message})
    }
});
authrouter.post("/api/sigup",async(req,res)=>{
    try{
     const {email,password}=req.body;
     let existinguser=await User.findOne({email});
     if(!existinguser){
        return res.status(400).json({mes:"This email doesnot exist in our app"})
     }
     if(password!=existinguser.password){
        return res.status(400).json({ mes: "Incorrect password." });
     }
     res.json(existinguser);
    }catch(e){
        res.status(500).json({mes:e.message})
    }
});
authrouter.post("/",async(req,res)=>{
    try{
     const{email}=req.body;
     let user=await User.findOne({email});
     res.json(user);
    }catch(e){
        res.status(500).json({mes:e.message});
    }
})
module.exports=authrouter;