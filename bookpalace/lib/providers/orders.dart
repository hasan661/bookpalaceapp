import 'dart:convert';

import 'package:bookpalace/models/httpexception.dart';
import 'package:bookpalace/providers/cart.dart';
import 'package:bookpalace/widgets/cartitem.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Order {
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

class OrderProvider with ChangeNotifier {
  List<Order> _order = [];

  List<Order> get order {
    return [..._order];
  }

  Future<void> fetchOrders() async {
    Uri url = Uri.parse(
        "https://bookpalaceapp-default-rtdb.firebaseio.com/orders.json");
    final List<Order> loadedOrders = [];
    
      final response = await http.get(url);
      final extractedorders =
          json.decode(response.body) as Map<String, dynamic>;
      extractedorders.forEach((key, value) {
        loadedOrders.add(Order(
            id: key,
            amount: value['amount'],
            dateTime: DateTime.parse(value['dateTime']),
            products: (value['orders'] as List<dynamic>)
                .map((e) => Cart(
                    quantity: e['qunatity'],
                    price: e['price'],
                    id: e['id'],
                    title: e['title']))
                .toList()));
      });
    

    _order = loadedOrders;
    notifyListeners();
  }

  Future<void> addorder(List<Cart> cartitems, double total) async {
    final datetime = DateTime.now();
    Uri url = Uri.parse(
        "https://bookpalaceapp-default-rtdb.firebaseio.com/orders.json");

    final response = await http.post(url,
        body: json.encode({
          "amount": total,
          "dateTime": datetime.toIso8601String(),
          "orders": cartitems
              .map((e) => {
                    "id": e.id,
                    "qunatity": e.quantity,
                    "title": e.title,
                    "price": e.price
                  })
              .toList(),
        }));
    if (response.statusCode >= 400) {
      throw HttpException("Check internte");
    }
    _order.insert(
        0,
        Order(
            id: DateTime.now().toString(),
            amount: total,
            dateTime: datetime,
            products: cartitems));
    notifyListeners();
  }
}
