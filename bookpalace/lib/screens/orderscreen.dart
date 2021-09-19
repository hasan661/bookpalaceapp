import 'package:bookpalace/providers/orders.dart';
import 'package:bookpalace/widgets/appdrawer.dart';
import 'package:bookpalace/widgets/orderitem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class OrderScreen extends StatelessWidget {
  const OrderScreen({ Key? key }) : super(key: key);
  static const routeName="/orders";

  @override
  Widget build(BuildContext context) {
    final orderData=Provider.of<OrderProvider>(context).order;
    
    return Scaffold(appBar: AppBar(
      title: Text("Orders"),
    ),
    drawer: AppDrawer(),
    body: ListView.builder(itemBuilder: (ctx, index)=>OrderItem(index), itemCount: orderData.length,));

  }
}