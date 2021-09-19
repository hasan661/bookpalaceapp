import 'package:bookpalace/providers/orders.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math';

class OrderItem extends StatefulWidget {
  final index;
  OrderItem(this.index);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _isexpanded = false;
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<OrderProvider>(context);
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text("\$${orderData.order[widget.index].amount}"),
            subtitle: Text("${orderData.order[widget.index].dateTime}"),
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  _isexpanded = !_isexpanded;
                });
              },
              icon: _isexpanded
                  ? Icon(Icons.expand_less)
                  : Icon(Icons.expand_more),
            ),

          ),
          if(_isexpanded)
          Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              height: min(orderData.order[widget.index].products.length * 20.0 + 10, 100),
              child: ListView(
                  children: orderData.order[widget.index].products
                      .map((e) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                e.title,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              Text("${e.quantity} x \$${e.price}", style: TextStyle(fontSize: 18, color: Colors.grey),)
                            ],
                          ))
                      .toList()),
            )
          
          
        ],
      ),
    );
  }
}
