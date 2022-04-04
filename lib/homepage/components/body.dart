// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_food_app/homepage/components/fragments/account_detail.dart';
import 'package:flutter_food_app/homepage/components/fragments/favorite_fragment.dart';
import 'package:flutter_food_app/homepage/components/fragments/home_fragment.dart';
import 'package:flutter_food_app/homepage/components/fragments/notification_fragment.dart';
import 'package:flutter_food_app/homepage/components/homeheader.dart';
import 'package:flutter_food_app/homepage/components/menuheader.dart';
import 'package:flutter_food_app/model/ultilities.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var selectIndex = 0;
  var flag = true;

  @override
  Widget build(BuildContext context) {
    List<Widget> screen = [
      HomeDetail(),
      FavoriteDetail(Ultilities.data),
      NotificationDetail(),
      AccountDetail()
    ];

    return Scaffold(
      appBar: AppBar(
        
        automaticallyImplyLeading: false,
        title: flag ? HomeHeader() : MenuHeader(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectIndex,
        onTap: (index){
          setState(() {
            selectIndex = index;
            if(selectIndex != 3){
              flag = true;
            }else{
              flag = false;
            }
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
              const SizedBox(height: 10,),
            screen[selectIndex]
          ],
        ),
      ),
    );
  }
}
