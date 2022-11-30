import 'package:flutter/material.dart';
import 'package:movieapp/common/bottom_navigationbar.dart';
import 'package:movieapp/feauters/details/screens/details_screen.dart';
import 'package:movieapp/feauters/home/screens/homepage.dart';
import 'package:movieapp/feauters/login/screens.dart/login_screen.dart';
import 'package:movieapp/feauters/login/screens.dart/sigin_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      );
    case SiginScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const SiginScreen(),
      );
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
