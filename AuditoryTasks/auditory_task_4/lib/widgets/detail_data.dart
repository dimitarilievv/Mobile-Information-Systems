import 'package:flutter/material.dart';

import '../models/pokemon_model.dart';

class DetailData extends StatelessWidget {
  final Pokemon pokemon;

  const DetailData({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Information',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _infoRow('Number', '#${pokemon.id.toString().padLeft(3, '0')}'),
          _infoRow('Name', pokemon.name),
          _infoRow('Type', pokemon.type),
          _infoRow('Height', '${pokemon.height}m'),
          _infoRow('Weight', '${pokemon.weight}kg'),
        ],
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 18)),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
