// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_food_app/detail/productpage.dart';
import 'package:flutter_food_app/model/products.dart';

class Search extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: const Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  String selectedResult = "";

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Center(
        child: Text(selectedResult),
      ),
    );
  }

  final List<Products> listExample;
  Search(this.listExample);

  List<Products> recentList = [];

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Products> suggestionList = [];
    query.isEmpty
        ? suggestionList = recentList //In the true case
        : suggestionList.addAll(listExample.where(
            (p) => p.title.toLowerCase().startsWith(query.toLowerCase())));

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            suggestionList[index].title,
          ),
          leading:
              query.isEmpty ? const Icon(Icons.access_time) : const SizedBox(),
          onTap: () {
            recentList.add(suggestionList[index]);
            Navigator.pushNamed(context, ProductPage.routeName,
                arguments:
                    ProductDetailArguments(products: suggestionList[index]));
            // selectedResult = suggestionList[index].title;
            // showResults(context);
          },
        );
      },
    );
  }
}
