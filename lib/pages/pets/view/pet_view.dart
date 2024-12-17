// ignore_for_file: avoid_print

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listwhatever/l10n/l10n.dart';
import 'package:listwhatever/pages/pets/bloc/pet_bloc.dart';
import 'package:listwhatever/pages/pets/bloc/pet_event.dart';
import 'package:listwhatever/pages/pets/view/pet_list.dart';

const petNames = [
  'Bella',
  'Max',
  'Charlie',
  'Luna',
  'Lucy',
  'Cooper',
  'Daisy',
  'Milo',
  'Buddy',
  'Rocky',
  'Molly',
  'Bailey',
  'Sadie',
  'Oliver',
  'Sophie',
  'Chloe',
  'Teddy',
  'Ruby',
  'Jack',
  'Lily',
];

const animalTypes = [
  'Dog',
  'Cat',
  'Lizard',
  'Fish',
  'Parrot',
  'Rat',
];

class PetView extends StatefulWidget {
  const PetView({super.key});

  @override
  State<StatefulWidget> createState() {
    return PetViewState();
  }
}

class PetViewState extends State<PetView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PetBloc>(context).add(LoadPets());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.petAppBarTitle)),
      body: const Center(child: PetList()),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'addpet',
            key: const ValueKey('addpet'),
            onPressed: () {
              final petName = petNames[Random().nextInt(petNames.length)];
              final animalType =
                  animalTypes[Random().nextInt(animalTypes.length)];
              context.read<PetBloc>().add(AddPet(petName, animalType));
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
