import 'package:flutter/material.dart';
import 'package:movieapp/feauters/details/screens/details_screen.dart';
import 'package:movieapp/feauters/favoutite/respository/favourite_repository.dart';
import 'package:provider/provider.dart';

import '../../../model/movie.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<Movie> favouritemovie = [];
  void getallfavourite() async {
    favouritemovie =
        await Provider.of<FavouriteRepository>(context, listen: false)
            .getallfavouriteitems(context);
    setState(() {});
  }

  @override
  void initState() {
    getallfavourite();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Favourite",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.builder(
              itemCount: favouritemovie.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 7,
                  childAspectRatio: 0.65,
                  mainAxisSpacing: 7),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailsScreen(movie: favouritemovie[index])));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 37, 37, 37),
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      favouritemovie[index].image))),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4, left: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                favouritemovie[index].name,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
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
                                            fontWeight: FontWeight.w500,
                                          ))
                                    ],
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        favouritemovie
                                            .remove(favouritemovie[index]);
                                        setState(() {});
                                        Provider.of<FavouriteRepository>(
                                                context,
                                                listen: false)
                                            .deleteitems(
                                                context: context,
                                                name:
                                                    favouritemovie[index].name);
                                      },
                                      icon: const Icon(
                                        Icons.favorite,
                                        color: Colors.red,
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
            )
          ],
        ),
      ),
    );
  }
}
