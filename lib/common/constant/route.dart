import 'package:flutter/material.dart';
import 'package:movieapp/common/screens/bottom_navigationbar.dart';
import 'package:movieapp/features/details/screens/details_screen.dart';
import 'package:movieapp/features/home/screens/homepage.dart';


Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
   
    case Hompage.routeName:
      return MaterialPageRoute(
        builder: (context) => const Hompage(),
      );
    case Bottomnavigationbar.routeName:
      return MaterialPageRoute(
        builder: (context) => const Bottomnavigationbar(),
      );

    case DetailsScreen.routeName:
      final arguments = routeSettings.arguments as Map<String, dynamic>;
      final movie = arguments["name"];
      return MaterialPageRoute(
        builder: (context) => DetailsScreen(movie: movie),
      );
    default:
      return MaterialPageRoute(
          builder: (context) => const Scaffold(
                body: Text("Screen is not display"),
              ));
  }
}
