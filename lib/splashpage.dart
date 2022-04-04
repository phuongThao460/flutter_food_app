// ignore_for_file: use_key_in_widget_constructors, unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter_food_app/signin/signinpage.dart';

class Splashpage extends StatelessWidget {
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    new Future.delayed(const Duration(seconds: 3), () {
      //Navigator.pushNamed(context, SignInPage.routeName);
      Navigator.pushNamedAndRemoveUntil(context, SignInPage.routeName, (Route<dynamic> route) => false);
      //Navigator.push(context, MaterialPageRoute(builder: ((context) => SignInPage())));
    });
    return Scaffold(
      body: SafeArea(
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(color: Colors.green),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(
                    backgroundColor: Colors.white,
                    strokeWidth: 5,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Loading...',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  )
                ],
              ))),
    );
  }
}
