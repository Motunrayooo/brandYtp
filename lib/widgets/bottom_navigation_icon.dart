import 'package:flutter/material.dart';
class BottomNavigationIcon extends StatelessWidget {
  BottomNavigationIcon({required this.icon, required this.ontap});
  final IconData icon;
  final void Function() ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Icon(icon,color: Colors.white,),
    );
  }
}