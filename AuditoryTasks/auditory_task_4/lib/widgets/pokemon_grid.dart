import 'package:flutter/material.dart';
import 'package:pokemon_app/widgets/pokemon_card.dart';

import '../models/pokemon_model.dart';

class PokemonGrid extends StatefulWidget {
  final List<Pokemon> pokemon;

  const PokemonGrid({super.key, required this.pokemon});

  @override
  State<StatefulWidget> createState() => _PokemonGridState();
}

class _PokemonGridState extends State<PokemonGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        childAspectRatio: 200/244
      ),
      itemCount: widget.pokemon.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return PokemonCard(pokemon: widget.pokemon[index]);
      },
    );
  }
}
