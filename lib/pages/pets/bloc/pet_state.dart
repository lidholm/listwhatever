import 'package:listwhatever/pages/pets/model/pet.dart';

sealed class PetState {}

class PetInitial extends PetState {}

class PetLoading extends PetState {}

class PetLoaded extends PetState {
  PetLoaded(this.pets);

  final List<Pet> pets;
}
