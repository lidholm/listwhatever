import 'package:bloc/bloc.dart';
import 'package:listwhatever/pages/firestore/bloc/pet_event.dart';
import 'package:listwhatever/pages/firestore/bloc/pet_state.dart';
import 'package:listwhatever/pages/firestore/model/pet.dart';
import 'package:listwhatever/pages/firestore/repository/pet_repository.dart';

class PetBloc extends Bloc<PetEvent, PetState> {
  PetBloc({required this.petRepository}) : super(PetInitial()) {
    on<LoadPets>(_onLoadPets);
    on<AddPet>(_onAddPet);
  }

  final PetRepository petRepository;

  Future<void> _onLoadPets(
    LoadPets event,
    Emitter<PetState> emit,
  ) async {
    emit(PetLoading());

    final pets = await petRepository.loadPets();
    emit(PetLoaded(pets));
  }

  Future<void> _onAddPet(
    AddPet event,
    Emitter<PetState> emit,
  ) async {
    emit(PetLoading());
    final pet = Pet(name: event.petName, animalType: event.animalType);
    await petRepository.addPet(pet);
    final pets = await petRepository.loadPets();
    emit(PetLoaded(pets));
  }
}
