import 'package:flutter/foundation.dart';

class FavoritesService extends ChangeNotifier {
  static final FavoritesService _instance = FavoritesService._internal();
  factory FavoritesService() => _instance;
  FavoritesService._internal();

  final List<String> _favoriteMealIds = [];
  List<String> get favoriteMealIds => List.unmodifiable(_favoriteMealIds);

  bool isFavorite(String mealId) {
    return _favoriteMealIds.contains(mealId);
  }

  void toggleFavorite(String mealId) {
    if (_favoriteMealIds.contains(mealId)) {
      _favoriteMealIds.remove(mealId);
    } else {
      _favoriteMealIds.add(mealId);
    }
    notifyListeners();
  }

  void addFavorite(String mealId) {
    if (!_favoriteMealIds.contains(mealId)) {
      _favoriteMealIds.add(mealId);
      notifyListeners();
    }
  }

  void removeFavorite(String mealId) {
    if (_favoriteMealIds.contains(mealId)) {
      _favoriteMealIds.remove(mealId);
      notifyListeners();
    }
  }
}
