// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter_food_app/detail/components/addtocart.dart';
import 'package:flutter_food_app/model/products.dart';

class Body extends StatelessWidget {
  Products product;
  Body({required this.product});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(product.image),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(child: Text(product.description)),
          AddToCart(
            product: product,
          )
        ],
      ),
    );
  }
}
