import 'package:flutter/material.dart';

import '../models/meal_model.dart';
import '../services/favorites_service.dart';
import 'meal_card.dart';

class MealGrid extends StatefulWidget {
  final List<Meal> meal;

  const MealGrid({super.key, required this.meal});

  @override
  State<StatefulWidget> createState() => _MealGridState();
}

class _MealGridState extends State<MealGrid> {
  final FavoritesService _favoritesService = FavoritesService();

  @override
  void initState() {
    super.initState();
    _favoritesService.addListener(_onFavoritesChanged);
  }

  @override
  void dispose() {
    _favoritesService.removeListener(_onFavoritesChanged);
    super.dispose();
  }

  void _onFavoritesChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        childAspectRatio: 200 / 244,
      ),
      itemCount: widget.meal.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        final meal = widget.meal[index];
        return MealCard(
          meal: meal,
          isFavorite: _favoritesService.isFavorite(meal.id.toString()),
          onToggleFavorite: () => _favoritesService.toggleFavorite(meal.id.toString()),
        );
      },
    );
  }
}
