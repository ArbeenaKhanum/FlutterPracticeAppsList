import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:native_features_app/helpers/db_helper.dart';

import '../models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(String pickedTitle, File pickedImage) {
    final newPlace = Place(
        id: DateTime.now().toString(),
        title: pickedTitle,
        location: PlaceLocation(latitude: 0.0, longitude: 0.0),
        image: pickedImage);
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path
    });
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.getData('user_places');
    dataList
        .map((item) => Place(
            id: item['id'],
            title: item['title'],
            location: PlaceLocation(latitude: 0.0, longitude: 0.0),
            image: File(item['image'])))
        .toList();
    notifyListeners();
  }
}
