import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopytp2/providers/welcome_screen_provider.dart';
import 'package:shopytp2/screens/search_screen.dart';
import 'package:shopytp2/screens/favorite_screen.dart';
import 'package:shopytp2/screens/cart_screen.dart';
import 'package:shopytp2/screens/profile_screen.dart';
import 'package:shopytp2/screens/home_screen.dart';
import 'package:shopytp2/widgets/bottom_navigation_bar.dart';

class WelcomeScreen extends StatefulWidget {



  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {


  List screens = [
    HomeScreen(),
    SearchScreen(),
    FavoriteScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    //method1: how to access the content of the provider class.me
    //creating the instance of the welcomescreenprovider class in other to be accessed in this file
    // final welcomeScreenProvider = Provider.of<WelcomeScreenProvider>(context, listen: true);

    //method 2:
    //using consumer widget: useful for optimizing the performance of an app, by selectively
    //rebuilding parts of  the UI that depends on specific state change rather than rebuilding the
    //entire UI hierachy


    final welcomeScreenProvider = Provider.of<WelcomeScreenProvider>(context);

    return
       Scaffold(
        body: screens[welcomeScreenProvider.pageListIndex],
        bottomNavigationBar: BottomNavBar(),

    );

  }
}
