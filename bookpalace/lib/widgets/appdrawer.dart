import 'package:bookpalace/screens/editproductscreen.dart';
import 'package:bookpalace/screens/orderscreen.dart';
import 'package:bookpalace/screens/userproductscreen.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text("Welcome Nerds"),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text("BookPalace"),
            onTap: (){
              Navigator.of(context).pushReplacementNamed("/");
            },
          ),
          Divider(),
          ListTile(
            title: Text("Orders"),
            leading: Icon(Icons.money),
            onTap: (){
              Navigator.of(context).pushReplacementNamed(OrderScreen.routeName);
            },
          ),
          Divider(),
          ListTile(
            title: Text("Manage Your Products"),
            leading: Icon(Icons.wifi_lock),
            onTap: (){
              Navigator.of(context).pushReplacementNamed(UserProductScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
