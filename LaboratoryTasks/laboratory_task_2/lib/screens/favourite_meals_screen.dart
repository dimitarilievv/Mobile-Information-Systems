import 'package:flutter/material.dart';
import '../models/meal_model.dart';
import '../widgets/meal_card.dart';
import '../services/api_service.dart';
import '../services/favorites_service.dart';

class FavoriteMealsScreen extends StatefulWidget {
  final List<String> favoriteMealIds;
  final Function(String) onToggleFavorite;

  const FavoriteMealsScreen({
    super.key,
    required this.favoriteMealIds,
    required this.onToggleFavorite,
  });

  @override
  State<FavoriteMealsScreen> createState() => _FavoriteMealsScreenState();
}

class _FavoriteMealsScreenState extends State<FavoriteMealsScreen> {
  final ApiService _apiService = ApiService();
  final FavoritesService _favoritesService = FavoritesService();
  List<Meal> _favoriteMeals = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _favoritesService.addListener(_onFavoritesChanged);
    _loadFavoriteMeals();
  }

  @override
  void dispose() {
    _favoritesService.removeListener(_onFavoritesChanged);
    super.dispose();
  }

  void _onFavoritesChanged() {
    _loadFavoriteMeals();
  }

  @override
  void didUpdateWidget(FavoriteMealsScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.favoriteMealIds != widget.favoriteMealIds) {
      _loadFavoriteMeals();
    }
  }

  Future<void> _loadFavoriteMeals() async {
    setState(() => _isLoading = true);

    final ids = _favoritesService.favoriteMealIds;
    if (ids.isEmpty) {
      setState(() {
        _favoriteMeals = [];
        _isLoading = false;
      });
      return;
    }

    final futures = ids.map((id) => _apiService.getMealById(id)).toList();
    final results = await Future.wait(futures);

    setState(() {
      _favoriteMeals = results.whereType<Meal>().toList();
      _isLoading = false;
    });
  }

  void _handleToggle(String id) {
    _favoritesService.toggleFavorite(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Favourite Meals")),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _favoriteMeals.isEmpty
          ? const Center(
        child: Text(
          "No favourite receipts 👀",
          style: TextStyle(fontSize: 18),
        ),
      )
          : GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          childAspectRatio: 200 / 244,
        ),
        itemCount: _favoriteMeals.length,
        itemBuilder: (context, index) {
          final meal = _favoriteMeals[index];
          return MealCard(
            meal: meal,
            isFavorite: _favoritesService.isFavorite(meal.id.toString()),
            onToggleFavorite: () => _handleToggle(meal.id.toString()),
          );
        },
      ),
    );
  }
}