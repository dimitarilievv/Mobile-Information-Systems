import 'package:flutter/material.dart';

import '../models/pokemon_model.dart';
import '../widgets/detail_image.dart';
import '../widgets/detail_title.dart';
import '../widgets/detail_data.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pokemon = ModalRoute.of(context)!.settings.arguments as Pokemon;

    return Scaffold(
      backgroundColor: Colors.red.shade50,
      appBar: AppBar(
        title: Text(pokemon.name.toUpperCase()),
        centerTitle: true,
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            DetailImage(image: pokemon.img),
            const SizedBox(height: 20),
            DetailTitle(id: pokemon.id, name: pokemon.name),
            const SizedBox(height: 30),
            DetailData(pokemon: pokemon),
          ],
        ),
      ),
    );
  }
}
