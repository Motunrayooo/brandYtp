import 'package:flutter/material.dart';
import 'package:shopytp2/widgets/bottom_navigation_bar.dart';
import 'package:shopytp2/widgets/background_container.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  static const String id = 'SearchScreen';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
      child: Stack(
        children: [
          BackgroundContainer(
              Container(),
            ),
        ],
      ),),
    );
  }
}
