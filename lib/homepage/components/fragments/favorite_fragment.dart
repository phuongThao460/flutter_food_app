// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, avoid_unnecessary_containers, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_food_app/homepage/components/fragments/favorite_product.dart';
import 'package:flutter_food_app/model/products.dart';

class FavoriteDetail extends StatelessWidget {
  List<Products> products;
  FavoriteDetail(this.products);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductItemList(product: products[index]);
              })),
    );
  }
}
