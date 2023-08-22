import 'package:flutter/material.dart';
import 'package:movieapp/common/constant/route.dart';
import 'package:movieapp/common/screens/splash_screen.dart';
import 'package:movieapp/features/favoutite/respository/favourite_repository.dart';
import 'package:movieapp/features/home/repository/home_repository.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider(create: (_) => LoginRepsitory()),
        // ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => Homerepository()),
        ChangeNotifierProvider(create: (_) => FavouriteRepository())
      ],
      child: MaterialApp(
        home: const SplashScreen(),
        onGenerateRoute: (settings) => generateRoute(settings),
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          searchViewTheme: SearchViewThemeData(backgroundColor: Colors.black),
            scaffoldBackgroundColor: Colors.black,
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: Colors.red)),
      ),
    );
  }
}
