// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_food_app/homepage/components/fragments/home_fragment_products.dart';
import 'home_fragment_categories.dart';

class HomeDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          CategoriesStore(),
          ProductPopular()
        ],
      ),
    );

  }
}
