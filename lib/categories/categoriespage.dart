// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_food_app/categories/components/body.dart';

class CategoriesPage extends StatelessWidget {
  static String routeName = '/categories_products';

  @override
  Widget build(BuildContext context) {
    final ProductsFromCategory _argument =
        ModalRoute.of(context)!.settings.arguments as ProductsFromCategory;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: Body(id: _argument.id),
    );
  }
}

class ProductsFromCategory {
  final int id;
  ProductsFromCategory({required this.id});
}
