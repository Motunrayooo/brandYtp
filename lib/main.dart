import 'package:flutter/material.dart';
import 'package:shopytp2/providers/welcome_screen_provider.dart';
import 'package:shopytp2/screens/welcomeScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

// MultiProvider(
// providers: [
//   ChangeNotifierProvider(create: (context) => WelcomeScreenProvider(),),
// ],
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return WelcomeScreenProvider();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: const TextTheme(
            headlineLarge: TextStyle(
              height: 1.5,
              color: Colors.white,
              fontSize: 42.0,
              // fontWeight: FontWeight.w600,
              fontFamily: 'Anton',
            ),
            headlineMedium: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 32.0,
            ),
            headlineSmall: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 28.0,
            ),
            titleLarge: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 45.0,
              color: Colors.black,
            ),
            titleMedium: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 25.0,
            ),
            titleSmall: TextStyle(fontSize: 22.0, color: Colors.grey),
          ),
        ),
        home: WelcomeScreen(),
      ),
    );
  }
}
