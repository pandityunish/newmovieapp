const mongoose=require("mongoose");

const favouriteScheam=mongoose.Schema({
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
const Favourite=mongoose.model("Favourites",favouriteScheam);
module.exports=Favourite;
