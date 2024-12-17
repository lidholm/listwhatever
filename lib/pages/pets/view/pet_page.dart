import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listwhatever/pages/pets/bloc/pet_bloc.dart';
import 'package:listwhatever/pages/pets/repository/pet_repository.dart';
import 'package:listwhatever/pages/pets/view/pet_view.dart';

class PetPage extends StatelessWidget {
  const PetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PetBloc(petRepository: PetRepository()),
      child: const PetView(),
    );
  }
}
