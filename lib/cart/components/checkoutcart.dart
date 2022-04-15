// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class CheckoutCart extends StatelessWidget {
  double sum;
  CheckoutCart({required this.sum});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
            child: TextButton(
          onPressed: () {},
          child: Text('Sum: $sum'),
          style: TextButton.styleFrom(
            textStyle: const TextStyle(fontSize: 18),
            primary: Colors.green,
          ),
        ))
      ],
    );
  }
}
