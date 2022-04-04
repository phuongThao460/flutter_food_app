import 'package:flutter/widgets.dart';
import 'package:flutter_food_app/homepage/homepage.dart';
import 'package:flutter_food_app/signin/signinpage.dart';
import 'package:flutter_food_app/signup/signuppage.dart';
import 'package:flutter_food_app/splashpage.dart';

final Map<String, WidgetBuilder> routes = {
  Splashpage.routeName : (context) => Splashpage(),
  SignInPage.routeName : (context) => SignInPage(),
  SignUpPage.routeName : (context) => SignUpPage(),
  HomePage.routeName : (context) => HomePage(),
};
