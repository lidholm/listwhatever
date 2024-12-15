import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listwhatever/pages/firestore/bloc/pet_bloc.dart';
import 'package:listwhatever/pages/firestore/repository/pet_repository.dart';
import 'package:listwhatever/pages/firestore/view/pet_view.dart';

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
