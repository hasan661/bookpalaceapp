import 'package:bookpalace/providers/booksprovider.dart';
import 'package:bookpalace/screens/editproductscreen.dart';

import 'package:bookpalace/widgets/appdrawer.dart';
import 'package:bookpalace/widgets/userproductitem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserProductScreen extends StatelessWidget {
  const UserProductScreen({Key? key}) : super(key: key);
  static const routeName = "/user-products";
  @override
  Widget build(BuildContext context) {
    final books = Provider.of<BooksProvider>(context).books;

    return Scaffold(
      appBar: AppBar(
        title: Text("Your Products"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) =>
            UserProductItem(books[index].title, books[index].imageURL, books[index].id),
        itemCount: books.length,
      ),
      drawer: AppDrawer(),
    );
  }
}
