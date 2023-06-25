import 'package:flutter/material.dart';
import 'package:shopytp2/widgets/bottom_navigation_bar.dart';
import 'package:shopytp2/widgets/background_container.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static const String id = 'ProfileScreen';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
        ),
      ),
    );
  }
}
