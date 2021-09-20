import 'package:bookpalace/providers/books.dart';
import 'package:flutter/cupertino.dart';

class BooksProvider with ChangeNotifier {
  List _books = [
    Books(
      authorName: "Stephen R Corey",
      content:
          "In The 7 Habits of Highly Effective People, author Stephen R. Covey presents a holistic, integrated, principle-centered approach for solving personal and professional problems. With penetrating insights and pointed anecdotes, Covey reveals a step-by-step pathway for living with fairness, integrity, service, and human dignity--principles that give us the security to adapt to change and the wisdom and power to take advantage of the opportunities that change creates.",
      id: "B1",
      price: 49.99,
      title: "The 7 Habits Of Highly Effective People",
      imageURL: "https://images-na.ssl-images-amazon.com/images/I/51hV5vGr4AL._SX326_BO1,204,203,200_.jpg",
      // backcoverimageURL: "https://cdn.shopify.com/s/files/1/0015/8285/8328/products/2e9a0560f0b520cd3448e7c6dcbd006f_466x700.jpg?v=1571712721",
    ),
     Books(
      authorName: "RobertT Kiyosaki",
      content:
          "Rich Dad Poor Dad is the #1 personal finance book of all time. Listen today to set yourself up for a wealthy, happy future.Robert Kiyosaki’s easy tips and straight talk will…",
      id: "B2",
      price: 55.99,
      title: "Rich Dad Poor Dad",
      imageURL: "https://kbimages1-a.akamaihd.net/c81ea4de-cfb7-415d-8634-314aad041fdb/1200/1200/False/rich-dad-poor-dad-9.jpg",
      // backcoverimageURL: "https://static-01.daraz.pk/p/b0fa08f2bd5251c39c1639fbc7730237.jpg",
    ),
     Books(
      authorName: "Mark Manson",
      content:
          "Rich Dad Poor Dad is the #1 personal finance book of all time. Listen today to set yourself up for a wealthy, happy future.Robert Kiyosaki’s easy tips and straight talk will…",
      id: "B3",
      price: 59.99,
      title: "Subtle Art Of Not Giving A F",
      imageURL: "https://images-na.ssl-images-amazon.com/images/I/71QKQ9mwV7L.jpg",
      // backcoverimageURL: "https://images-na.ssl-images-amazon.com/images/I/51pCXWFd7CL.jpg",
    ),
    Books(
      authorName: "Timothy Feriss",
      content:
          "Rich Dad Poor Dad is the #1 personal finance book of all time. Listen today to set yourself up for a wealthy, happy future.Robert Kiyosaki’s easy tips and straight talk will…",
      id: "B4",
      price: 30.99,
      title: "The 4 Hour Work Week",
      imageURL: "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1442957271l/368593._SY475_.jpg",
      // backcoverimageURL: "https://images-na.ssl-images-amazon.com/images/I/71u20s3+Z7L.jpg",
    ),


    
    
    
  ];

  List get books{
    return [..._books];
  }
  Books filterbyid(var bookid){
    return _books.firstWhere((element) => element.id==bookid);
  }

  List favoritebooks(bool isfavorite){
    return [...books.where((element) => element.isFavorite==isfavorite)];
  }
  void addbooks(Books book){
    final newbook=Books(imageURL: book.imageURL, authorName: book.authorName, content: book.content, id: DateTime.now().toString(), price: book.price, title: book.title);
    _books.add(newbook);
    notifyListeners();
  }

  void updatebooks(id, Books newbook){
   final bookid= _books.indexWhere((element) => element.id==id);
   if(bookid>=0)
   {
     _books[bookid]=newbook;
     notifyListeners();
   }


  
  }
  void deletebook(id){
    _books.removeWhere((element) => element.id==id);
    notifyListeners();
  }
  
  
}
