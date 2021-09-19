import 'package:bookpalace/providers/books.dart';
import 'package:bookpalace/providers/cart.dart';
import 'package:bookpalace/screens/cartscreen.dart';
import 'package:bookpalace/widgets/appdrawer.dart';
import 'package:bookpalace/widgets/bookitem.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:bookpalace/providers/booksprovider.dart';

import 'package:provider/provider.dart';

enum FilterOptions { Favorites, All }

class BookOverviewScreen extends StatefulWidget {
  @override
  _BookOverviewScreenState createState() => _BookOverviewScreenState();
}

class _BookOverviewScreenState extends State<BookOverviewScreen> {
  var _showfavoriteonly=false;

  @override
  Widget build(BuildContext context) {
    int index = 0;
    final bookData =_showfavoriteonly? Provider.of<BooksProvider>(context).favoritebooks(_showfavoriteonly) :Provider.of<BooksProvider>(context).books;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Our Collection",
          textAlign: TextAlign.center,
        ),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOptions val) {
              setState(() {
              if(val==FilterOptions.All)
              {
                _showfavoriteonly=false;
                
              }
              else{
                _showfavoriteonly=true;
              }
              });

            },
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text("All Books"),
                value: FilterOptions.All,
              ),
              PopupMenuItem(
                child: Text("Only Favorites"),
                value: FilterOptions.Favorites,
              )
            ],
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).pushNamed(CartScreen.routeName);
            },
          )
        ],
      ),
      drawer: AppDrawer(),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          CarouselSlider(
            items: bookData
                .map(
                  (e) => ChangeNotifierProvider<Books>.value(
                      value: bookData[index++], child: BookItem()),
                )
                .toList(),
            options: CarouselOptions(
              height: 500.0,
              enlargeCenterPage: true,
            ),
          ),
        ],
      ),
    );
  }
}
