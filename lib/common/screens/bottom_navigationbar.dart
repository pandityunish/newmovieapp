import 'package:flutter/material.dart';
import 'package:movieapp/features/category/screens/category.dart';
import 'package:movieapp/features/favoutite/screens/favoutire_screen.dart';
import 'package:movieapp/features/home/screens/homepage.dart';

class Bottomnavigationbar extends StatefulWidget {
  static const String routeName = "/bottomnavigation-bar";
  const Bottomnavigationbar({super.key});

  @override
  State<Bottomnavigationbar> createState() => _BottomnavigationbarState();
}

class _BottomnavigationbarState extends State<Bottomnavigationbar> {
  int selectindex = 0;
  void selectitem(int i) {
    selectindex = i;
    setState(() {});
  }

  List<Widget> childern = [
    const Hompage(),
    const CategoryScreen(),
    const FavouriteScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: childern[selectindex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectindex,
          onTap: selectitem,
          unselectedItemColor: Colors.grey,
         type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          backgroundColor: Colors.black,
          showSelectedLabels: false,
          
          showUnselectedLabels: false,
          landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
          items: const [
            BottomNavigationBarItem(
                backgroundColor: Colors.black,
                label: "Home",
                icon: Icon(
                  Icons.home,
                  size: 35,
                )),
            BottomNavigationBarItem(
                label: "Catogory",
                icon: Icon(
                  Icons.category_outlined,
                  size: 35,
                )),
            BottomNavigationBarItem(
                label: "Favorite",
                icon: Icon(
                  Icons.favorite_border,
                  size: 35,
                )),
            
          ]),
    );
  }
}
