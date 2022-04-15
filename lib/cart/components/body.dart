// ignore_for_file: use_key_in_widget_constructors, avoid_function_literals_in_foreach_calls, sized_box_for_whitespace, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_food_app/model/carts.dart';
import 'package:flutter_food_app/model/products.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Products> cartdetails = Cart().getCart();
  double sum = 0.0;

  @override
  void initState() {
    super.initState();
    cartdetails.forEach((element) {
      sum = sum + element.price;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Expanded(child: ListView.builder(itemBuilder: (context, index) {
            return Column(
              children: [
                GestureDetector(
                  child: CartItem(products: cartdetails[index]),
                  onTap: () {
                    setState(() {
                      cartdetails.removeAt(index);
                      sum = 0.0;
                      cartdetails.forEach((product) { sum = sum + product.price; });
                    });
                  },
                ),
                const Divider(),
              ],
            );
          }))
        ],
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  Products products;
  CartItem({required this.products});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF5F5F5),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          SizedBox(
            height: 100,
            width: 100,
            child: Image.asset(products.image),
          ),
          Expanded(child: Text(products.title)),
          Expanded(child: Text(products.description)),
          const Icon(Icons.delete_outline)
        ],
      ),
    );
  }
}
