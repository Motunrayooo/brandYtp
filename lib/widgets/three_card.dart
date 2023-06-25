import 'package:flutter/material.dart';
class ThreeCards extends StatelessWidget {
  const ThreeCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16.0),),
        child: Container(
          height: 130.0,
          width: 115.0,
          color: Colors.white,
        ),
      ),
    );
  }
}
