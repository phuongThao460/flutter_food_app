import 'package:flutter/cupertino.dart';
import 'package:flutter_food_app/signin/components/signin_form.dart';

// ignore: use_key_in_widget_constructors
class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SignInForm()
          ],
        ),
      ),
    );
  }
}