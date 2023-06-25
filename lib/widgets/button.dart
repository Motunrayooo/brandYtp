import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button({required this.onTap, required this.title});
  final void Function()? onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(top: 12.0),
        height: 60.0,
        width: 360.0,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
          color: Colors.black,
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style:
          Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }
}
