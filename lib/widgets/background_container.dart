import 'package:flutter/material.dart';

class BackgroundContainer extends StatelessWidget {

BackgroundContainer(this.child);
   final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      height: 800.0,
      width: 710.0,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            'images/background_portrait.jpg',
          ),
        ),
      ),
      child: child,
    );
  }
}
