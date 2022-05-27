// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_food_app/model/carts.dart';

class NotificationDetail extends StatefulWidget {
  @override
  State<NotificationDetail> createState() => _NotificationDetailState();
}

class _NotificationDetailState extends State<NotificationDetail> {
  List cart = Cart().pay();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12.0),
          child: ListView.separated(
              separatorBuilder: (context, index) {
                return const Divider(color: Colors.black26, height: 5,);
              },
              shrinkWrap: true,
              itemCount: cart.length,
              itemBuilder: (context, index) {
                return OrderDetail(order: cart[index]);
              })),
    );
  }
}

class OrderDetail extends StatelessWidget {
  Order order;
  OrderDetail({
    required this.order,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create at: " + order.dateTime.toString(),
                style: const TextStyle(fontSize: 15),
              ),
              SizedBox(
                width: 280,
                child: Text(
                  "Status: " + order.state,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  maxLines: 3,
                  style: const TextStyle(fontSize: 15),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
