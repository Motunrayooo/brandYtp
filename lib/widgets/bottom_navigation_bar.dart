import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopytp2/widgets/bottom_navigation_icon.dart';
import '../providers/welcome_screen_provider.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:ionicons/ionicons.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final welcomeScreenProvider =
        Provider.of<WelcomeScreenProvider>(context, listen: true);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(12.0),
          margin: const EdgeInsets.symmetric(horizontal: 10.0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
            color: Colors.black,
          ),
          height: MediaQuery.of(context).size.height*0.07,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            BottomNavigationIcon(
              ontap: () {
                welcomeScreenProvider.newPageIndex = 0;
              },
              icon: welcomeScreenProvider.pageListIndex == 0
                  ? CommunityMaterialIcons.home
                  : CommunityMaterialIcons.home_outline,
            ),
            BottomNavigationIcon(
              icon: welcomeScreenProvider.pageListIndex == 1
                  ? Ionicons.search
                  : Ionicons.search_outline,
              ontap: () {
                welcomeScreenProvider.newPageIndex = 1;
              },
            ),
            BottomNavigationIcon(
              icon: welcomeScreenProvider.pageListIndex == 2
                  ? Ionicons.heart
                  : Ionicons.heart_outline,
              ontap: () {
                welcomeScreenProvider.newPageIndex = 2;
              },
            ),
            BottomNavigationIcon(
              icon: welcomeScreenProvider.pageListIndex == 3
                  ? Icons.shopping_cart
                  : Icons.shopping_cart_outlined,
              ontap: () {
                welcomeScreenProvider.newPageIndex = 3;
              },
            ),
            BottomNavigationIcon(
              icon: welcomeScreenProvider.pageListIndex == 4
                  ? Ionicons.person
                  : Ionicons.person_outline,
              ontap: () {
                welcomeScreenProvider.newPageIndex = 4;
              },
            ),
          ]),
        ),
      ),
    );
  }
}
