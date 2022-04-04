// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class MenuHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width ,
        height: 70,
        alignment: Alignment.centerLeft,
        decoration: const BoxDecoration(color: Colors.green),
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const Expanded(
                    child: Text(
                  "Account Info",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "Save",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                )
              ],
            )));
  }
}
