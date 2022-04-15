// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';

class CategoriesDetail extends StatefulWidget {
  int id;
  CategoriesDetail({required this.id});
  @override
  State<CategoriesDetail> createState() => _CategoriesDetailState();
}

class _CategoriesDetailState extends State<CategoriesDetail> {
  @override
  Widget build(BuildContext context) {
    return const Text('this us +');
  }
}
