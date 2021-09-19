import 'package:flutter/cupertino.dart';

class Books with ChangeNotifier {
  String id;
  String title;
  String authorName;
  double price;
  String content;
  bool isFavorite;
  String imageURL;

  Books({
    required this.imageURL,
    required this.authorName,
    required this.content,
    required this.id,
    required this.price,
    required this.title,
    this.isFavorite = false,
  });

  void togglefavorite()
  {
    isFavorite=!isFavorite;
    notifyListeners();

  }
}
