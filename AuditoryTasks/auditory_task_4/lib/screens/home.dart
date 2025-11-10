import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/pokemon_model.dart';
import '../widgets/pokemon_grid.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // final List<Pokemon> pokemon = List.generate(8, (index) {
  //   return Pokemon(
  //     id: index + 1,
  //     name: "Pokemon ${index + 1}",
  //     img:
  //     "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png",
  //   );
  // });

  late final List<Pokemon> _pokemon;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPokemonList(n: 20);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: EdgeInsets.all(12),
              child: PokemonGrid(pokemon: _pokemon),
            ),
    );
  }

  void _loadPokemonList({required int n}) async {
    List<Pokemon> pokemonList = [];

    for (var i = 0; i < n; i++) {
      final id = i + 1;

      final detailResponse = await http.get(
        Uri.parse('https://pokeapi.co/api/v2/pokemon/$id'),
      );

      if (detailResponse.statusCode == 200) {
        final detailData = json.decode(detailResponse.body);

        pokemonList.add(Pokemon.fromJson(detailData));
      }
    }

    setState(() {
      _pokemon = pokemonList;
      _isLoading = false;
    });
  }
}
