import 'package:bookpalace/providers/booksprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookDetailScreen extends StatelessWidget {
  const BookDetailScreen({Key? key}) : super(key: key);
  static const routeName = "/book-detail";

  Widget text(var text) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Text(
        "$text",
        style: TextStyle(fontSize: 20, color: Colors.grey,),
        textAlign: TextAlign.justify,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bookID = ModalRoute.of(context)!.settings.arguments;
    final bookitem =
        Provider.of<BooksProvider>(context, listen: false).filterbyid(bookID);
    print(bookitem);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${bookitem.title}",
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                "${bookitem.imageURL}",
                height: 400,
                width: 400,
                fit: BoxFit.scaleDown,
              ),
              text(
                "\$${bookitem.price}",
              ),
              text(
                "${bookitem.content}",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
