import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String? id;
  final String? title;
  final String? description;
  final String? imageUrl;
  final String? hashTag;
  final String? creatorUrl;
  final String? creatorName;
  int totalView;
  int totalStars;
  bool isFavorite;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.imageUrl,
    @required this.hashTag,
    @required this.creatorUrl,
    @required this.creatorName,
    this.totalView = 0,
    this.totalStars = 0,
    this.isFavorite = false,
  });

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    isFavorite ? totalStars++ : totalStars--;
    notifyListeners();
  }

  void countViewTimes() {
    totalView++;
    notifyListeners();
  }
}
