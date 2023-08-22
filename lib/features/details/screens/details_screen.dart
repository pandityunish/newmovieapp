import 'package:flutter/material.dart';
import 'package:movieapp/features/details/repository/download_section.dart';
import 'package:movieapp/features/details/repository/play_video.dart';
import 'package:movieapp/features/details/repository/widget_details.dart';
import 'package:movieapp/features/favoutite/respository/favourite_repository.dart';
import 'package:movieapp/features/home/repository/home_repository.dart';
import 'package:movieapp/model/movie.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class DetailsScreen extends StatefulWidget {
  static const String routeName = "detalils-page";
  final Result movie;
  const DetailsScreen({super.key, required this.movie});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final topheight = 300;
  bool isadded = false;
  @override
  Widget build(BuildContext context) {
        final favouritemovie = Provider.of<FavouriteRepository>(context);

    final size = MediaQuery.of(context).size;
    final double top = topheight - 100;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.55,
              width: size.width,
              child: Stack(
                children: [
                  Container(
                    height: 300,
                    width: size.width,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            opacity: 0.6,
                            fit: BoxFit.cover,
                            image: NetworkImage("https://image.tmdb.org/t/p/w500${widget.movie.backdropPath}"))),
                  ),
                  Positioned(
                      top: 15,
                      child: SizedBox(
                        width: size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                if(favouritemovie.favoritemovie.contains(widget.movie)){

                                }else{
                                favouritemovie.addtofavorite(widget.movie);
                                isadded=true;
                                setState(() {
                                  
                                });
                                }
                              },
                              icon: isadded
                                  ?const Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    ):favouritemovie.movie.contains(widget.movie)? const Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    )
                                  : const Icon(
                                      Icons.favorite_outline,
                                      color: Colors.white,
                                    ),
                            ),
                          ],
                        ),
                      )),
                  Positioned(
                      top: top,
                      child: SizedBox(
                        width: size.width,
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Container(
                                height: 190,
                                width: 130,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 6,
                                          spreadRadius: 4,
                                          color: Colors.red.withOpacity(0.2),
                                          blurStyle: BlurStyle.solid)
                                    ],
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image:
                                            NetworkImage("https://image.tmdb.org/t/p/w500${widget.movie.posterPath}"))),
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.2,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          PlayVideo(link: "https://www.youtube.com/watch?v=4wxyy8Rcz4k&ab_channel=DC"),
                                    ));
                              },
                              child: Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(40),
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 3,
                                          spreadRadius: 4,
                                          color: Colors.red.withOpacity(0.2),
                                          blurStyle: BlurStyle.solid)
                                    ]),
                                child: const Icon(
                                  Icons.play_arrow,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            )
                          ],
                        ),
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Itemsofdetails(
                  icon: Icons.add,
                  callback: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PlayVideo(link: "https://www.youtube.com/watch?v=4wxyy8Rcz4k&ab_channel=DC"),
                        ));
                  },
                ),
                Itemsofdetails(
                  icon:isadded
                                  ? 
                                      Icons.favorite
                                      
                                  : 
                                      Icons.favorite_outline,
                                      
                                     
                  callback: () {
if(favouritemovie.favoritemovie.contains(widget.movie)){

                                }else{
                                favouritemovie.addtofavorite(widget.movie);
                                isadded=true;
                                setState(() {
                                  
                                });
                                }
                  },
                ),
                Itemsofdetails(
                  icon: Icons.download,
                  callback: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Downloadmovie(
                            url: "https://www.youtube.com/watch?v=4wxyy8Rcz4k&ab_channel=DC", name: widget.movie.title??"");
                      },
                    );
                  },
                ),
                Itemsofdetails(
                  icon: Icons.share,
                  callback: () async {
                    await Share.share(widget.movie.title??"Something",
                        subject: "${widget.movie.title??"Something"} movie link");
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.8,
                    child: Text(
                      widget.movie.title??"Something",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                widget.movie.overview,
                style: const TextStyle(color: Colors.white),
              ),
            ),
             const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Text("Released: ",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 16),),
                  Text(widget.movie.releaseDate.toString(),style: TextStyle(color: Colors.white),)
                ],
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Text("IMDB: ",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.yellow,fontSize: 16),),
                  Text(widget.movie.voteAverage.toStringAsFixed(2),style: TextStyle(color: Colors.yellow),)
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Recommended",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 21,
                        color: Colors.white),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "See All",
                        style: TextStyle(color: Colors.grey),
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            FutureBuilder<Movie>(
              future: Provider.of<Homerepository>(context, listen: false)
                  .getallmovie(context: context),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center();
                } else {
                  return SizedBox(
                    height: 140,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.results.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            height: 100,
                            width: 230,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                       "https://image.tmdb.org/t/p/w500${snapshot.data!.results[index].posterPath}"))),
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
