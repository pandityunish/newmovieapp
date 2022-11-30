const mongoose=require("mongoose");

const moviesScheam=mongoose.Schema({
  name:{
    type:String,
    required:true
  } ,
  image:{
    type:String,
    required:true
  }  ,
  desc:{
    type:String,
    required:true
  },
  link:{
    type:String,
    required:true
  }    
});
const Movies=mongoose.model("movies",moviesScheam);
module.exports=Movies;
