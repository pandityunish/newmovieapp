import 'package:flutter/material.dart';
import 'package:movieapp/feauters/home/repository/home_repository.dart';
import 'package:movieapp/model/movie.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<String>? foodListSearch;
  final FocusNode _textFocusNode = FocusNode();

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: Container(
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(10)),
            child: TextField(
              controller: _textEditingController,
              focusNode: _textFocusNode,
              autofocus: true,
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: 'Search here',
                  hintStyle: TextStyle(color: Colors.white),
                  contentPadding: EdgeInsets.all(8)),
              onChanged: (value) {
                setState(() {});
              },
            ),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<List<Movie>>(
              future: Provider.of<Homerepository>(context, listen: false)
                  .getallmovie(context: context),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
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
                      if (_textEditingController.value.text.isEmpty) {
                        return Container(
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
                                            snapshot.data![index].image))),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4, left: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                              fontWeight: FontWeight.w500,
                                            ))
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      } else if (snapshot.data![index].name
                          .toLowerCase()
                          .contains(
                              _textEditingController.text.toLowerCase())) {
                        return Container(
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
                                            snapshot.data![index].image))),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4, left: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                              fontWeight: FontWeight.w500,
                                            ))
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      } else {
                        return const Center();
                      }
                    },
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
