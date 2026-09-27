import 'package:animal_app/features/animal/model/animal.dart';
import 'package:animal_app/features/home/ui/widgets/home_animal_card.dart';
import 'package:animal_app/features/home/ui/widgets/home_empty_state.dart';
import 'package:flutter/material.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({super.key, required this.animals});

  final List<Animal> animals;

  @override
  Widget build(BuildContext context) {
    if (animals.isEmpty) {
      return const HomeEmptyState(
        title: 'No Animal Found!',
        message: 'There is no Animal to display.',
      );
    }

    return ListView(
      padding: const EdgeInsets.fromLTRB(18, 16, 18, 16),
      children: [
        for (var i = 0; i < animals.length; i++) ...[
          if (i > 0) const SizedBox(height: 17),
          HomeAnimalCard(animal: animals[i]),
        ],
      ],
    );
  }
}
