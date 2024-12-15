import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listwhatever/pages/firestore/bloc/pet_bloc.dart';
import 'package:listwhatever/pages/firestore/bloc/pet_state.dart';
import 'package:listwhatever/pages/firestore/model/pet.dart';

class PetList extends StatelessWidget {
  const PetList({super.key});

  @override
  Widget build(BuildContext context) {
    final petState = context.watch<PetBloc>().state;
    return switch (petState) {
      PetInitial() => handlePetInitial(),
      PetLoading() => handlePetLoading(),
      PetLoaded() => handlePetLoaded(context, petState.pets),
    };
  }

  Widget handlePetInitial() {
    return const Text('No pets yet. Initial'); // ProgressIndicator
  }

  Widget handlePetLoading() {
    return const Text('Loading pets...'); // ProgressIndicator
  }

  Widget handlePetLoaded(BuildContext context, List<Pet> pets) {
    final theme = Theme.of(context);
    return Column(
      children: List.generate(
        pets.length,
        (i) => ListTile(
          title: Text(pets[i].name, style: theme.textTheme.displaySmall),
          subtitle: Text(pets[i].animalType),
        ),
      ),
    );
  }
}
