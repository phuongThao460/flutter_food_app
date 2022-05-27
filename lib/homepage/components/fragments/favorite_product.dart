// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter_food_app/model/products.dart';

class ProductItemList extends StatelessWidget {
  Products product;

  ProductItemList({required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: Image.asset(
                product.image,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: SizedBox(
                  height: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.title),
                      Expanded(
                          child: Text(
                        product.description,
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                      ))
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
