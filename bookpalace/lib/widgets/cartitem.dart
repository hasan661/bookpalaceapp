import 'package:bookpalace/providers/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String prodid;
  final double price;
  final int quantity;
  final String title;

  CartItem(
      {required this.quantity,
      required this.price,
      required this.id,
      required this.title,
      required this.prodid});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      onDismissed: (direction){
        Provider.of<CartProvider>(context,listen: false).deleteitem(prodid);

      },
      direction: DismissDirection.startToEnd,
      child: ListTile(
        leading: CircleAvatar(
          // minRadius: 1.0,
          child: FittedBox(
              child: Text(
            "$price",
            textAlign: TextAlign.center,
          )),
        ),
        title: Text(
          "$title",
        ),
        trailing: Text(
          "x$quantity",
        ),
      ),
    );
  }
}
