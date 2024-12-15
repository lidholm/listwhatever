sealed class PetEvent {}

class LoadPets extends PetEvent {
  LoadPets();
}

class AddPet extends PetEvent {
  AddPet(this.petName, this.animalType);

  final String petName;
  final String animalType;
}
