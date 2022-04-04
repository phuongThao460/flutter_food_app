// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter_food_app/model/products.dart';

class ProductItemList extends StatelessWidget {
  Products product;

  ProductItemList({required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: Image.asset(
              product.image,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.title,
                style: const TextStyle(fontSize: 15),
              ),
              SizedBox(
                width: 280,
                child: Text(
                  product.description,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  maxLines: 3,
                  style: const TextStyle(fontSize: 15),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
