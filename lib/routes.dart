import 'package:flutter/widgets.dart';
import 'package:flutter_food_app/cart/cartpage.dart';
import 'package:flutter_food_app/categories/categoriespage.dart';
import 'package:flutter_food_app/detail/productpage.dart';
import 'package:flutter_food_app/homepage/homepage.dart';
import 'package:flutter_food_app/signin/signinpage.dart';
import 'package:flutter_food_app/signup/signuppage.dart';
import 'package:flutter_food_app/splashpage.dart';

final Map<String, WidgetBuilder> routes = {
  Splashpage.routeName: (context) => Splashpage(),
  SignInPage.routeName: (context) => SignInPage(),
  SignUpPage.routeName: (context) => SignUpPage(),
  HomePage.routeName: (context) => HomePage(),
  ProductPage.routeName: (context) => ProductPage(),
  CartPage.routeName: (context) => CartPage(),
  CategoriesPage.routeName: (context) => CategoriesPage(),
};
