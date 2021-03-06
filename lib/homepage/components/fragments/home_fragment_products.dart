// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, avoid_unnecessary_containers, must_be_immutable, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_food_app/detail/productpage.dart';
import 'package:flutter_food_app/model/products.dart';
import 'package:flutter_food_app/model/ultilities.dart';

class ProductPopular extends StatelessWidget {
  final products = Products.init();

  @override
  Widget build(BuildContext context) {
    var productsAPI = Products.init();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: const [
              Expanded(
                  child: Text(
                'Popular Products ',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              )),
              Text(
                'See more',
                style: TextStyle(fontSize: 16, color: Colors.lightGreen),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
              child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  primary: false,
                  itemCount: products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.7),
                  itemBuilder: (context, index) {
                    return ProductItem(
                      product: products[index],
                    );
                  })),
        ],
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  Products product;

  ProductItem({required this.product});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (Ultilities.data.contains(product) == false) {
          Ultilities.data.add(product);
          print('add have');
        }

        Navigator.pushNamed(context, ProductPage.routeName,
            arguments: ProductDetailArguments(products: product));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            product.image,
            fit: BoxFit.fill,
          ),
          Row(
            children: [
              Expanded(child: Text(product.title)),
              Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(2),
                      color: Colors.green),
                  child: Text(
                    product.price.toString(),
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
