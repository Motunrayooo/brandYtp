import 'package:flutter/material.dart';


class ColourIcon extends StatelessWidget {
  const ColourIcon(this.colours);

  final Color colours;

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.circle,
      size: 16.0,
      color: colours,
    );
  }
}