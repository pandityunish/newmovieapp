import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/features/details/screens/details_screen.dart';
import 'package:movieapp/features/home/repository/home_repository.dart';
import 'package:movieapp/features/search/screen.dart/search_screen.dart';
import 'package:movieapp/model/movie.dart';
import 'package:provider/provider.dart';

class Hompage extends StatefulWidget {
  static const String routeName = "/homepage";
  const Hompage({super.key});

  @override
  State<Hompage> createState() => _HompageState();
}

class _HompageState extends State<Hompage> {
 Movie ? movies;
  void getmovies()async{
movies=await Homerepository().getallmovie(context: context);
setState(() {
  
});
  }
  @override
  void initState() {
    getmovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: movies==null?Center(
          child: CircularProgressIndicator(),
        ): SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        
                        children: [
                          // FutureBuilder<User>(
                          //   future: Provider.of<LoginRepsitory>(context,
                          //           listen: false)
                          //       .getuserdata(email: email!, context: context),
                          //   builder: (context, snapshot) {
                          //     if (snapshot.connectionState ==
                          //         ConnectionState.waiting) {
                          //       return const Center();
                          //     } else {
                          //       return Column(
                          //         crossAxisAlignment: CrossAxisAlignment.start,
                          //         children: [
                          //           Text(
                          //             "Hello ${snapshot.data!.name}",
                          //             style: const TextStyle(
                          //                 fontSize: 23,
                          //                 fontWeight: FontWeight.bold,
                          //                 color: Colors.white),
                          //           ),
                          //           const Text(
                          //             "What To Watch?",
                          //             style: TextStyle(color: Colors.grey),
                          //           )
                          //         ],
                          //       );
                          //     }
                          //   },
                          // ),
                          Text(
                                      "Welcome User,",
                                      style: const TextStyle(
                                          fontSize: 23,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                          
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          print(movies);
                          showSearch(context: context, delegate: SearchMovieDelecates(posts: movies!.results));
                        },
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 100, 100, 100),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.search,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    "Search",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Trending Movies",
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
                      SizedBox(height: 5,),
                      FutureBuilder<Movie>(
                        future:
                            Provider.of<Homerepository>(context, listen: false)
                                .getallmovie(context: context),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center();
                          } else {
                            return SizedBox(
                              height: 290,
                              width: MediaQuery.of(context).size.width * 0.95,
                              child: CarouselSlider.builder(
                                  itemCount: snapshot.data!.results.length,
                                  itemBuilder: (context, index, realIndex) {
                                    return InkWell(
                                        onTap: () {
                                          Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DetailsScreen(
                                                movie: snapshot.data!.results[index])));
                                          // Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: (context) =>
                                          //             DetailsScreen(
                                          //                 movie: snapshot
                                          //                     .data!.results[index])));
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage("https://image.tmdb.org/t/p/w500${snapshot
                                                      .data!.results[index].posterPath}"))),
                                        ));
                                  },
                                  options: CarouselOptions(
                                      initialPage: 1,
                                      height: 290,
                                      autoPlay: false,
                                      viewportFraction: 0.5,
                                      aspectRatio: 2.2,
                                      enlargeCenterPage: true)),
                            );
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "All Movies",
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
                      SizedBox(height: 5,),
                      FutureBuilder<Movie>(
                        future:
                            Provider.of<Homerepository>(context, listen: false)
                                .getallmovie(context: context),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center();
                          } else {
                            return GridView.builder(
                              itemCount: snapshot.data!.results.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 10,
                                      childAspectRatio: 0.6,
                                      mainAxisSpacing: 10),
                              itemBuilder: (context, index) {
                                final data=snapshot.data!.results[index];
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DetailsScreen(
                                                movie: snapshot.data!.results[index])));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 37, 37, 37),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height:200,
                                       
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(data.posterPath==null?"https://image.tmdb.org/t/p/w500/6oH378KUfCEitzJkm07r97L0RsZ.jpg": "https://image.tmdb.org/t/p/w500${snapshot
                                                      .data!.results[index].posterPath}"))),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 3, left: 8),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                               data.title==null?"Something": snapshot.data!.results[index].title!,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 18),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              const Text("Action",
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.w500,
                                                  )),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                children:  [
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.yellow,
                                                    size: 20,
                                                  ),
                                                  SizedBox(width: 4,),
                                                  Text(data.voteAverage.toStringAsPrecision(2),
                                                      style: TextStyle(
                                                        color: Colors.grey,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ))
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ));
  }
}
