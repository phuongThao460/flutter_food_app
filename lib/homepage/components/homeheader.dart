// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_food_app/cart/cartpage.dart';
import 'package:flutter_food_app/homepage/components/fragments/searching.dart';
import 'package:flutter_food_app/model/carts.dart';
import 'package:flutter_food_app/model/products.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeHeader extends StatelessWidget {
  List cart = Cart().getCart();
  final List<Products> _list = Products.init();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              showSearch(context: context, delegate: Search(_list));
            },
            child: Container(
                color: Colors.transparent,
                child: const IgnorePointer(
                  child: TextField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Search product",
                        prefixIcon: Icon(Icons.search)),
                  ),
                )),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (cart.isEmpty) {
              Fluttertoast.showToast(
                  msg: "Cart is Empty",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            } else {
              Navigator.pushNamed(context, CartPage.routeName);
            }
          },
          child: Container(
              height: 40,
              width: 40,
              padding: const EdgeInsets.all(10),
              child: const Icon(Icons.shopping_cart_outlined)),
        )
      ],
    );
  }
}
