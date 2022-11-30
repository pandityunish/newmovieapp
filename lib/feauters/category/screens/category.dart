import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/movie.dart';
import '../../home/repository/home_repository.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              "Category",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white),
            ),
            FutureBuilder<List<Movie>>(
              future: Provider.of<Homerepository>(context, listen: false)
                  .getallmovie(context: context),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center();
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image.network(snapshot.data![index].image),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Action",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            const Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 30,
                              color: Colors.white,
                            )
                          ],
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
    );
  }
}
