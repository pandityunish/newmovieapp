import 'package:flutter/material.dart';
import 'package:movieapp/common/route.dart';
import 'package:movieapp/common/splash_screen.dart';
import 'package:movieapp/feauters/favoutite/respository/favourite_repository.dart';
import 'package:movieapp/feauters/home/repository/home_repository.dart';
import 'package:movieapp/feauters/login/repository/login_repository.dart';
import 'package:movieapp/feauters/login/widgets/user_provider.dart';
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
        ChangeNotifierProvider(create: (_) => LoginRepsitory()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => Homerepository()),
        ChangeNotifierProvider(create: (_) => FavouriteRepository())
      ],
      child: MaterialApp(
        home: const SplashScreen(),
        onGenerateRoute: (settings) => generateRoute(settings),
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.black,
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: Colors.red)),
      ),
    );
  }
}
