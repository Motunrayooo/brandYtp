import 'package:flutter/material.dart';
class WelcomeScreenProvider extends ChangeNotifier{
  int _pageListIndex = 0;

  int get pageListIndex => _pageListIndex;
  //the getter method allows external code to retrieve the value of the private variable
//but does not allow direct modification of the private variable

set newPageIndex(newIndex){
  _pageListIndex = newIndex;
  notifyListeners();
}
//setter method allows the update of the eternal state  of an object
// while maintaining encapsulation
}
