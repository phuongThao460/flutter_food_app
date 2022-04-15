// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_food_app/homepage/components/fragments/home_fragment_products.dart';
import 'package:flutter_food_app/model/categories.dart';
import 'package:flutter_food_app/model/products.dart';
import 'package:flutter_food_app/model/ultilities.dart';

class Body extends StatelessWidget {
  Categories? categories;
  int id;
  Body({required this.id});

  @override
  Widget build(BuildContext context) {
    List<Products> products = Ultilities().getProductFomCate(id);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          primary: false,
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.7

          ),
          itemBuilder: (context, index) {
            return ProductItem(
              product: products[index],
            );
          }),
    );
  }
}
