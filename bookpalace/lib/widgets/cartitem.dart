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
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text("Are You Sure?"),
            content: Text("Pressing Yes Will Delete This Item From The Cart"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop(true);
                },
                child: Text("Yes"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop(false);
                },
                child: Text("No"),
              )
            ],
          ),
        );
      },
      key: ValueKey(id),
      onDismissed: (direction) {
        Provider.of<CartProvider>(context, listen: false).deleteitem(prodid);
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
