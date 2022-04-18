// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_food_app/categories/components/categories_details.dart';
//import 'package:flutter_food_app/homepage/components/fragments/home_fragment_products.dart';
class Body extends StatelessWidget {
  int id;
  Body({required this.id});

  @override
  Widget build(BuildContext context) {
    return CategoriesDetail(id: id);
  }
}
