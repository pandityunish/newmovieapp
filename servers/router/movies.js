const express=require("express");
const Movies = require("../model/movies");


const moviesRouter=express.Router();

moviesRouter.get("/upcommingMovies",async(req,res)=>{
    try{
     let movies=await Movies.find({});
     res.json(movies);
    }catch(e){
        res.status(500).json({mes:e.message})
    }
});
moviesRouter.post("/uploadmovies",async(req,res)=>{
    try{
    const {name,image,desc,link}=req.body;
    let movie=await Movies({
        name,
        image,
        desc,
        link
    });
    movie=await movie.save();
    res.json(movie);
    }catch(e){
        res.status(500).json({mes:e.message})
    }
});
moviesRouter.post("/searchmovies",async(req,res)=>{
    try{
        const{name}=req.body;
     const movies=await Movies.find({
        name,
     });
     res.json(movies);
    }catch(e){
        res.status(500).json({mes:e.message})
    }
})
module.exports=moviesRouter;