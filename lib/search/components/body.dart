// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter_food_app/homepage/components/fragments/favorite_product.dart';
import 'package:flutter_food_app/model/products.dart';
import 'package:flutter_food_app/model/ultilities.dart';

class Body extends StatefulWidget {
  List<Products> dataProduct = [];

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final List<String> _tags = [];
  List<Products> products = Products.init();
  List<Products> productsResult = [];

  TextEditingController textEditingController = new TextEditingController();
  @override
  void initState() {
    super.initState();
    _tags.addAll(['food', 'categories', 'bread']);
  }

  Widget buildTag(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Recommend'),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget buildContainer(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          buildTag(context),
          if (widget.dataProduct.isEmpty)
            const Expanded(child: Center(child: Text('No item')))
          else
            Expanded(
                child: ListView.builder(
                    itemCount: widget.dataProduct.length,
                    itemBuilder: (context, index) {
                      return ProductItemList(
                        product: widget.dataProduct[index],
                      );
                    }))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: buildRow(),
      ),
      body: buildContainer(context)
    );
  }

  Widget buildRow() {
    return Row(
        children: [
          Expanded(
            child: TextField(
              controller: textEditingController,
              decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Search product",
                  prefixIcon: Icon(Icons.search)
              ),
              onChanged: (value){
                  setState(() {
                    if(value.isEmpty){
                      widget.dataProduct = [];
                      return;
                    }
                    widget.dataProduct.clear();
                    widget.dataProduct.addAll(Ultilities.find(value));
                  });
              },
            ),
          ),

        ],
      );
  }

}
