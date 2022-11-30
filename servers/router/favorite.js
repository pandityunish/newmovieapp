const express=require("express");
const { default: mongoose } = require("mongoose");
const Favourite = require("../model/favorite");
const mongodb=require("mongodb");

const favoriteRoute=express.Router();

favoriteRoute.post("/addfavourite",async(req,res)=>{
    try{
     const {name,link,desc,image}=req.body;
     let existingitem=await Favourite.findOne({name});
     if(existingitem){
        res.status(400).json({mes:"This movie is already in favourite"})
     }else{
        let favourite=await Favourite({
            name,
            image,
            desc,
            link
             });
             favourite=await favourite.save();
             res.json(favourite);
     }
  

    }catch(e){
        res.status(500).json({mes:e})
    }
});
favoriteRoute.get("/getallfavourite",async(req,res)=>{
    try{
    let favouriteitems=await Favourite.find({});
    res.json(favouriteitems);
    }catch(e){
        res.status(500).json({mes:e})
    }
});
favoriteRoute.delete("/deletefavouriteitem",async(req,res)=>{
    try{
     const{name}=req.body;
     let favouriteitems=await Favourite.findOneAndDelete({name});
     res.json(favouriteitems);
    }catch(e){
        res.status(500).json({mes:e.message})
    }
})
module.exports=favoriteRoute;