import 'package:flutter/material.dart';
import 'package:flutter_food_app/routes.dart';
import 'package:flutter_food_app/splashpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: Splashpage.routeName,
      routes: routes,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: FavoriteDetail(Ultilities.data),
    );
  }
}
