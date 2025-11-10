import 'package:flutter/material.dart';

import '../models/pokemon_model.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/details", arguments: pokemon);
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
              Expanded(child: Image.network(pokemon.img)),
              Divider(),
              Text(pokemon.name, style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}
