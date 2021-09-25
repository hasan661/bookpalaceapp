import 'package:bookpalace/providers/orders.dart';
import 'package:bookpalace/widgets/appdrawer.dart';
import 'package:bookpalace/widgets/orderitem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class OrderScreen extends StatefulWidget {
  const OrderScreen({ Key? key }) : super(key: key);
  static const routeName="/orders";

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  var isInit=true;

  void getorders()async {
    
    await Provider.of<OrderProvider>(context).fetchOrders();
  
   

  }
  @override
  void didChangeDependencies() {
      if(isInit){
        getorders();
      }
      isInit=false;

    // TODO: implement didChangeDependencies
    
    
  }
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