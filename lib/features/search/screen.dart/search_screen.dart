import 'package:flutter/material.dart';
import 'package:movieapp/features/details/screens/details_screen.dart';
import 'package:movieapp/features/home/repository/home_repository.dart';
import 'package:movieapp/model/movie.dart';
import 'package:provider/provider.dart';



class SearchMovieDelecates extends SearchDelegate {
  final List<Result> posts;
  
  SearchMovieDelecates({required this.posts});
@override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      textTheme:const TextTheme(
        // Use this to change the query's text style
        titleLarge: TextStyle(fontSize: 20.0, ),
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor:Color.fromARGB(255, 194, 190, 190),
      ),
      inputDecorationTheme:const InputDecorationTheme(
        border: InputBorder.none,
      
        // Use this change the placeholder's text style
        hintStyle: TextStyle(fontSize: 20.0),
      ),
    );
  }
  @override
  List<Widget>? buildActions(BuildContext context) {
    
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    
    List<Result> matchQuery = [];
    for (var item in posts) {
      if (item.title==null?"Something".toLowerCase().contains(query.toLowerCase()):item.title!.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
                              itemCount: matchQuery.length,
                              shrinkWrap: true,
                              
                             
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 10,
                                      
                                      childAspectRatio: 0.6,
                                      mainAxisSpacing: 10),
                              itemBuilder: (context, index) {
                                final data=matchQuery[index];
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DetailsScreen(
                                                movie: matchQuery[index])));
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
                                          ///6oH378KUfCEitzJkm07r97L0RsZ.jpg
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(data.posterPath==null?"https://image.tmdb.org/t/p/w500/6oH378KUfCEitzJkm07r97L0RsZ.jpg": "https://image.tmdb.org/t/p/w500${
                                                      data.posterPath}"))),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 4, left: 8),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                               data.title==null?"Something": matchQuery[index].title!,
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
                            )
    );
    // return ListView.builder(
    //   itemCount: matchQuery.length,
    //   itemBuilder: (context, index) {
    //     final data = matchQuery[index];
    //     return ProductCard(
    //                     product: data,callback: () {
                     
    //                   },);
    //   },
    // );
   
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    
    List<Result> matchQuery = [];
    for (var item in posts) {
      if (item.title==null?"".toLowerCase().contains(query.toLowerCase()):item.title!.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    if(matchQuery.isEmpty){
          return Center(
            child: Text('No results found for "$query"'),
          );
        }else{
          
    return Container(
      color: Colors.black,
      child: ListView.builder(
        
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
    
          final data = matchQuery[index];
          
          return InkWell(
            onTap: () {
              query = data.title??"Something";
            },
            child: ListTile(
              title: Text(data.title??"Someting",style: TextStyle(color: Colors.white),
              ),
              trailing: Icon(Icons.arrow_upward,color: Colors.white,),
            ),
          );
        },
      ),
    );
        }
  }
}
