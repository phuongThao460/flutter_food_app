// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_food_app/homepage/components/body.dart';


class HomePage extends StatelessWidget {
  int selectIndex = 0;
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Body();
  }
}

