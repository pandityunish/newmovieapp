import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/feauters/details/screens/details_screen.dart';
import 'package:movieapp/feauters/home/repository/home_repository.dart';
import 'package:movieapp/feauters/login/repository/login_repository.dart';
import 'package:movieapp/feauters/search/screen.dart/search_screen.dart';
import 'package:movieapp/model/movie.dart';
import 'package:movieapp/model/user_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Hompage extends StatefulWidget {
  static const String routeName = "/homepage";
  const Hompage({super.key});

  @override
  State<Hompage> createState() => _HompageState();
}

class _HompageState extends State<Hompage> {
  String? email;
  void getsetvalue() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    email = sharedPreferences.getString("email");
    setState(() {});
  }

  @override
  void initState() {
    getsetvalue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: email == null
            ? const Center()
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FutureBuilder<User>(
                            future: Provider.of<LoginRepsitory>(context,
                                    listen: false)
                                .getuserdata(email: email!, context: context),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center();
                              } else {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Hello ${snapshot.data!.name}",
                                      style: const TextStyle(
                                          fontSize: 23,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    const Text(
                                      "What To Watch?",
                                      style: TextStyle(color: Colors.grey),
                                    )
                                  ],
                                );
                              }
                            },
                          ),
                          const CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.black,
                            backgroundImage: AssetImage("assets/images.png"),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SearchScreen()));
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
                            "Upcoming Movies",
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
                      FutureBuilder<List<Movie>>(
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
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (context, index, realIndex) {
                                    return InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DetailsScreen(
                                                          movie: snapshot
                                                              .data![index])));
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(snapshot
                                                      .data![index].image))),
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
                            "New Movies",
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
                      FutureBuilder<List<Movie>>(
                        future:
                            Provider.of<Homerepository>(context, listen: false)
                                .getallmovie(context: context),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center();
                          } else {
                            return GridView.builder(
                              itemCount: snapshot.data!.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 7,
                                      childAspectRatio: 0.7,
                                      mainAxisSpacing: 7),
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DetailsScreen(
                                                movie: snapshot.data![index])));
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
                                          height: 200,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(snapshot
                                                      .data![index].image))),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 4, left: 8),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                snapshot.data![index].name,
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
                                                children: const [
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.yellow,
                                                    size: 20,
                                                  ),
                                                  Text("8.5",
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
