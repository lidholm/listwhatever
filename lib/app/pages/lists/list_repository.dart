// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:listanything/app/firebase/firebase_firestore_extensions.dart';
import 'package:listanything/app/pages/lists/list_of_things.dart';
import 'package:listanything/app/widgets/standardWidgets/custom_exception.dart';
import 'package:listanything/app/widgets/standardWidgets/error_monitor.dart';

abstract class BaseListRepository {
  Stream<List<ListOfThings>> retrieveListsStream();
  // Stream<ListOfThings> retrieveTeamStream({required String teamName});
  Future<String> createList({required ListOfThings list});
  Future<String> updateList({required ListOfThings list});
  // Future<void> deleteItem({required SimpleTodoItem itemId});
}

class ListRepository implements BaseListRepository {
  ListRepository(this.firestore, this.errorMonitor, this.userId);

  final ErrorMonitor errorMonitor;
  final FirebaseFirestore firestore;
  final String? userId;

  @override
  Stream<List<ListOfThings>> retrieveListsStream() async* {
    try {
      if (userId == null) {
        yield* Stream.value([]);
      }

      final query = firestore.lists(userId!);
      yield* query.snapshots().map(convertCollection);
    } on FirebaseException catch (e, s) {
      await errorMonitor.recordError(e, s, 'as an example of non-fatal error');
      throw CustomException(message: e.message);
    }
  }

  // @override
  // Stream<Team> retrieveTeamStream({required String teamName}) async* {
  //   try {
  //     // if (user == null) {
  //     //   yield* Stream.value([]);
  //     // }

  //     final query = firestore.team(teamName);
  //     yield* query.snapshots().map(convertDocument);
  //   } on FirebaseException catch (e, s) {
  //     await errorMonitor.recordError(e, s, 'as an example of non-fatal error');
  //     throw CustomException(message: e.message);
  //   }
  // }

  ListOfThings convertDocument(DocumentSnapshot<Map<String, dynamic>> doc) {
    try {
      final list = ListOfThings.fromJson(doc.data()!).copyWith(id: doc.id);
      return list;
    } on FirebaseException catch (e, s) {
      // ignore: flutter_style_todos, todo
      //TODO: Should be await
      errorMonitor.recordError(e, s, 'as an example of non-fatal error');
      throw CustomException(message: e.message);
    }
  }

  List<ListOfThings> convertCollection(QuerySnapshot<Map<String, dynamic>> list) {
    try {
      final lists = list.docs.map((d) {
        return ListOfThings.fromJson(d.data()).copyWith(id: d.id);
      }).toList();
      return lists;
    } on FirebaseException catch (e, s) {
      // ignore: flutter_style_todos, todo
      //TODO: Should be await
      errorMonitor.recordError(e, s, 'as an example of non-fatal error');
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<String> createList({required ListOfThings list}) async {
    if (userId == null) throw const CustomException(message: 'User is not logged in');

    try {
      final data = list.toJson();
      print('data: $data');
      final ref = await firestore.lists(userId!).add(data);
      return ref.id;
    } on FirebaseException catch (e, s) {
      await errorMonitor.recordError(e, s, 'as an example of non-fatal error');
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<String> updateList({required ListOfThings list}) async {
    if (userId == null) throw const CustomException(message: 'User is not logged in');

    try {
      await firestore.list(userId!, list.id!).update(list.toJson());
      return list.id!;
    } on FirebaseException catch (e, s) {
      await errorMonitor.recordError(e, s, 'as an example of non-fatal error');
      throw CustomException(message: e.message);
    }
  }

  // @override
  // Future<void> deleteItem({required String itemId}) async {
  //   try {
  //     await firestore.mapWithListRef(user!.uid, mapType!.id!).doc(itemId).delete();
  //   } on FirebaseException catch (e, s) {
  //     await firebaseCrashlytics.recordError(e, s, reason: 'as an example of non-fatal error');
  //     throw CustomException(message: e.message);
  //   }
  // }
}
