import 'package:flutter/material.dart';

class HomeTopMenu{
  late Color colors;

  HomeTopMenu(this.colors);

  Color get getColor {
    return colors;
  }
  set setColor(Color colors) {
    this.colors= colors;
  }



}