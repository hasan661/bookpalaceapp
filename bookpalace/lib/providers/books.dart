import 'dart:convert';

import 'package:bookpalace/models/httpexception.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

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

  Future<void> togglefavorite(String id) async {
    final currentstatus = isFavorite;
    Uri url = Uri.parse(
        "https://bookpalaceapp-default-rtdb.firebaseio.com/books/$id.json");
    final response =
        await http.patch(url, body: json.encode({"isFavorite": !isFavorite}));
    if (response.statusCode >= 400) {
      isFavorite = currentstatus;
      throw HttpException("Check internet connection");
    }

    isFavorite = !isFavorite;

    notifyListeners();
  }
}
