import 'package:flutter/material.dart';
import 'package:pokemon_app/screens/details.dart';
import 'package:pokemon_app/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemon App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const MyHomePage(title: 'Pokemon App'),
        "/details": (context) => const DetailsPage(),
      },
    );
  }
}
