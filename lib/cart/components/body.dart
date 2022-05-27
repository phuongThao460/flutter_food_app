// ignore_for_file: use_key_in_widget_constructors, avoid_function_literals_in_foreach_calls, sized_box_for_whitespace, must_be_immutable, unnecessary_new
import 'package:flutter/material.dart';
import 'package:flutter_food_app/homepage/homepage.dart';
import 'package:flutter_food_app/model/carts.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List cartdetails = Cart().getCart();
  double sum = 0.0;

  @override
  void initState() {
    super.initState();
    cartdetails.forEach((element) {
      sum = sum + (element['price'] * element['quantity']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: cartdetails.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: CartItem(
                      productsImage: cartdetails[index]['image'],
                      productName: cartdetails[index]['name'],
                      quantity: cartdetails[index]['quantity'],
                      price: cartdetails[index]['price'],
                    ),
                    onTap: () {
                      setState(() {
                        cartdetails.removeAt(index);
                        sum = 0.0;
                        cartdetails.forEach((product) {
                          sum = sum + (product['price'] * product['quantity']);
                        });
                      });
                    },
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text('$sum'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: SizedBox(
              width: (MediaQuery.of(context).size.width),
              child: ElevatedButton(
                onPressed: () {
                  Cart().getCart().clear();
                  Cart().getOrder(new Order(
                      dateTime: DateTime.now(),
                      state: "Your order waiting to check..."));
                  Navigator.pushNamed(context, HomePage.routeName);
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green)),
                child: const Text(
                  'CheckOut',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  String productName;
  String productsImage;
  double price;
  double quantity;
  CartItem(
      {required this.productName,
      required this.productsImage,
      required this.price,
      required this.quantity});

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
            child: Image.asset(productsImage),
          ),
          Expanded(child: Text(productName)),
          Expanded(child: Text(quantity.toString())),
          Expanded(child: Text(price.toString())),
          const Icon(Icons.delete_outline)
        ],
      ),
    );
  }
}
