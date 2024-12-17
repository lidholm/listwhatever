import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:listwhatever/pages/pets/firestore.dart';
import 'package:listwhatever/pages/pets/model/pet.dart';

class PetRepository {
  Future<CollectionReference<Map<String, dynamic>>> getCollection() async {
    const path = '/pets';
    return (await getFirestore()).collection(path);
  }

  Future<List<Pet>> loadPets() async {
    final listsCollection = await getCollection();
    final snapshot = await listsCollection.get();
    return snapshot.docs.map((doc) {
      return convertToPet(doc.id, doc.data());
    }).toList();
  }

  Future<String> addPet(Pet pet) async {
    final listsCollection = await getCollection();
    final ref = await listsCollection.add(pet.toJson());
    return ref.id;
  }

  Pet convertToPet(String id, Map<String, dynamic> data) {
    final list = Pet.fromJson(data);
    return list.copyWith();
  }
}
