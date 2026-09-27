import 'package:animal_app/core/l10n/l10n_extension.dart';
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
      return HomeEmptyState(
        title: context.l10n.noAnimalFound,
        message: context.l10n.noAnimalMessage,
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
