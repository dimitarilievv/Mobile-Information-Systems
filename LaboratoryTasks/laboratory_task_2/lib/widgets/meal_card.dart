import 'package:flutter/material.dart';

import '../models/meal_model.dart';

class MealCard extends StatelessWidget {
  final Meal meal;
  final bool isFavorite;
  final VoidCallback onToggleFavorite;

  const MealCard({super.key, required this.meal, required this.isFavorite, required this.onToggleFavorite});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/meal-details", arguments: meal.id);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.red.shade300, width: 3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(child: Image.network(meal.image)),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      meal.name,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  IconButton(
                    icon: Icon(
                      isFavorite ? Icons.star : Icons.star_border,
                      color: Colors.amber,
                    ),
                    onPressed: onToggleFavorite,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
