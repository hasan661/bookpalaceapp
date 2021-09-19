import 'package:bookpalace/providers/books.dart';
import 'package:bookpalace/providers/booksprovider.dart';
import 'package:bookpalace/providers/cart.dart';
import 'package:bookpalace/screens/bookdetailscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookItem extends StatelessWidget {
  // final index;
  // BookItem(this.index);
  Widget text(var text) {
    return Text(
      "$text",
      style: TextStyle(fontSize: 20, color: Colors.grey),
    );
  }

  @override
  Widget build(BuildContext context) {
    final book=Provider.of<Books>(context);
    final cartData=Provider.of<CartProvider>(context, listen: false);


    return Column(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                BookDetailScreen.routeName,
                arguments: book.id
              );
            },
            child: GridTile(
              footer: GridTileBar(
                title: Text(
                  book.title,
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.black87,
                leading: IconButton(
                  icon: book.isFavorite?Icon(Icons.favorite) :Icon(Icons.favorite_outline),
                  onPressed: () {
                    book.togglefavorite();
                  },
                ),
                trailing: Consumer<CartProvider>(
                  builder: (context, cartData, _)=>IconButton(
                    onPressed: () {
                      cartData.addtocart(book.id, book.price, book.title);
                     
                    },
                    icon: Icon(Icons.shopping_cart_outlined),
                  ),
                ),
              ),
              child: Image.network(
                book.imageURL,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              text(
                "Author Name : ${book.authorName}",
              ),
              SizedBox(
                height: 10,
              ),
              text(
                "Price : \$${book.price}",
              ),
              text("________________________________")
            ],
          ),
        )
      ],
    );
  }
}
