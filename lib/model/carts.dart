import 'products.dart';

class Cart {
  static List cart = [];
  static List<Order> orderList = [];
  static double quantity = 0;
  void addProductToCart(Products product, double quantity) {
    var trending = {
      "id": product.id,
      "image": product.image,
      "name": product.title,
      "quantity": quantity,
      "price": product.price,
    };
    cart.add(trending);
  }

  void getOrder(Order order) {
    orderList.add(order);
  }

  List<Order> pay() {
    return orderList;
  }

  List getCart() {
    return cart;
  }
}

class Order {
  DateTime dateTime;
  String state;
  Order({required this.dateTime, required this.state});
}
