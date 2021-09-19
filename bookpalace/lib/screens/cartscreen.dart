import 'package:bookpalace/providers/cart.dart';
import 'package:bookpalace/providers/orders.dart';
import 'package:bookpalace/widgets/cartitem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const routeName = "/cart";

  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<CartProvider>(context);
    final orderData=Provider.of<OrderProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total Amount:  "),
                Row(
                  children: [
                    Chip(
                      backgroundColor: Theme.of(context).primaryColor,
                      label: Text(
                        "\$${cartData.totalamount()}",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        orderData.addorder(cartData.cartitems.values.toList(), cartData.totalamount());
                        cartData.clearcart();

                      },
                      child: Text("Place Order"),
                    )
                  ],
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (ctx, index) => CartItem(
                  id: cartData.cartitems.values.toList()[index].id,
                  price: cartData.cartitems.values.toList()[index].price,
                  prodid: cartData.cartitems.keys.toList()[index],
                  quantity: cartData.cartitems.values.toList()[index].quantity,
                  title: cartData.cartitems.values.toList()[index].title,
                ),
                itemCount: cartData.cartitems.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
