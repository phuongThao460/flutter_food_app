// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_food_app/detail/components/addtocart.dart';
import 'package:flutter_food_app/model/products.dart';

class Body extends StatefulWidget {
  Products product;
  Body({required this.product});
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var product;
  int value = 1;
  @override
  void initState() {
    super.initState();
    product = widget.product;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(product.image),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(child: Text(product.description)),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Text('Price: ${product.price}'),
          ),
          Row(
            children: [
              const Text('Quantity: '),
              IconButton(
                  iconSize: 15,
                  onPressed: () {
                    setState(() {
                      value++;
                    });
                  },
                  icon: const Icon(Icons.arrow_upward)),
              Text('$value'),
              IconButton(
                  iconSize: 15,
                  onPressed: () {
                    setState(() {
                      value--;
                    });
                  },
                  icon: const Icon(Icons.arrow_downward))
            ],
          ),
          AddToCart(
            product: product,
          )
        ],
      ),
    );
  }
}
