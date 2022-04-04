// ignore_for_file: use_key_in_widget_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_food_app/signup/components/body_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: const [
            Text(
              "Register Account",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                  height: 1.5),
            ),
            Text(
              "Complete your details or continue \nwith social media",
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xFF4caf50)),
            ),
            BodyForm()
          ],
        ),
      ),
    ));
  }
}
