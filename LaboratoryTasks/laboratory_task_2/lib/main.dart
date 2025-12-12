import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:laboratory_task_2/screens/details.dart';
import 'package:laboratory_task_2/screens/favourite_meals_screen.dart';
import 'package:laboratory_task_2/screens/meal_details.dart';
import 'package:laboratory_task_2/services/notification_service.dart';

import 'screens/home.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await NotificationService.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Meals App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
      ),
      routes: {
        "/": (context) => const MyHomePage(title: 'Meals App'),
        "/home": (context) => const MyHomePage(title: 'Meals App'),
        "/details": (context) => const DetailsPage(),
        "/meal-details": (context) => const MealDetailsPage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == "/favorites") {
          final args = settings.arguments as Map;
          return MaterialPageRoute(
            builder: (context) => FavoriteMealsScreen(
              favoriteMealIds: args["favoriteMeals"],
              onToggleFavorite: args["onToggleFavorite"],
            ),
          );
        }
        return null;
      },
    );
  }
}
