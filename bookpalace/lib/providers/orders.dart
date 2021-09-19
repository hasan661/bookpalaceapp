import 'package:bookpalace/providers/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class Order{
  final String id;
  final double amount;
  final List<Cart> products;
  final DateTime dateTime;

  Order(
      {required this.id,
      required this.amount,
      required this.dateTime,
      required this.products});
}

class OrderProvider with ChangeNotifier{
  List<Order> _order=[];

  List<Order> get order{
    return [..._order];
  }


  void addorder(List<Cart> cartitems, double total )
  {
    _order.insert(0, Order(id: DateTime.now().toString(), amount: total, dateTime: DateTime.now(), products: cartitems));
    notifyListeners();
  }

}