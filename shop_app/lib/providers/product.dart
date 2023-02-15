import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavourite;

  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.imageUrl,
      this.isFavourite = false});

  void _setFavourite(bool newValue) {
    isFavourite = newValue;
    notifyListeners();
  }

  void toggleFavoriteStatus(String? authToken, String userId) async {
    final oldStatus = isFavourite;
    isFavourite = !isFavourite;
    notifyListeners();
    final url = Uri.parse(
        'https://flutterpracticeshopapp-default-rtdb.firebaseio.com/userFavorites/$userId/$id.json?auth=$authToken');
    try {
      final response = await http.put(url, body: json.encode(isFavourite));
      /* await http.patch(url,
          body: json.encode({'isFavourite': isFavourite}));*/
      if (response.statusCode >= 400) {
        _setFavourite(oldStatus);
      }
    } catch (error) {
      _setFavourite(oldStatus);
    }
  }
}
