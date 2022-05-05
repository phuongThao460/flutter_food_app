// ignore_for_file: unnecessary_import, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_app/detail/components/body.dart';
import 'package:flutter_food_app/model/products.dart';

class ProductPage extends StatelessWidget {
  static String routeName = '/details';

  @override
  Widget build(BuildContext context) {
    final ProductDetailArguments arguments =
        ModalRoute.of(context)!.settings.arguments as ProductDetailArguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(arguments.products.title),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: Body(product: arguments.products),
    );
  }
}

class ProductDetailArguments {
  final Products products;
  ProductDetailArguments({required this.products});
}
