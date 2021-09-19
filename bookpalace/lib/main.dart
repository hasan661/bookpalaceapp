import 'package:bookpalace/providers/booksprovider.dart';
import 'package:bookpalace/providers/cart.dart';
import 'package:bookpalace/providers/orders.dart';
import 'package:bookpalace/screens/bookdetailscreen.dart';
import 'package:bookpalace/screens/bookoverviewscreen.dart';
import 'package:bookpalace/screens/cartscreen.dart';
import 'package:bookpalace/screens/orderscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
         ChangeNotifierProvider(
        create: (ctx)=>BooksProvider(),),
        ChangeNotifierProvider(create: (ctx)=>CartProvider(),),
        ChangeNotifierProvider(create: (ctx)=>OrderProvider(),)

      ],
      child:
        MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
          
            primarySwatch: Colors.purple,
            
          ),
          routes: {
            "/":(ctx)=>BookOverviewScreen(),
            BookDetailScreen.routeName:(ctx)=>BookDetailScreen(),
            CartScreen.routeName:(ctx)=>CartScreen(),
            OrderScreen.routeName:(ctx)=>OrderScreen()
          },
          
        ),
      
    );
  }
}


