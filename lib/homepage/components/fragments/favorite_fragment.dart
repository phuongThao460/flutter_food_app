// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, avoid_unnecessary_containers, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_food_app/homepage/components/fragments/favorite_product.dart';
import 'package:flutter_food_app/model/products.dart';

class FavoriteDetail extends StatelessWidget {
  //List<Products> products;
  final product = Products.init();
  FavoriteDetail(product);

  @override
  Widget build(BuildContext context) {
    print(product.length.toString());
    return Expanded(
      child: Container(
          child: ListView.builder(
              //scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: product.length,
              itemBuilder: (context, index) {
                return ProductItemList(product: product[index]);
              })),
    );
  }
}
