import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:listanything/app/pages/lists/list_of_things.dart';
import 'package:listanything/app/pages/lists/list_repository_provider.dart';
import 'package:listanything/app/pages/lists/lists_provider.dart';
import 'package:listanything/app/pages/lists/participated_list_repository_provider.dart';
import 'package:listanything/app/widgets/standardWidgets/base_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockBaseRepository<T> extends Mock implements BaseRepository<T> {}

final listRepository = MockBaseRepository<ListOfThings>();
final sharedListRepository = MockBaseRepository<ListOfThings>();

void main() {
  setUp(() {
    when(
      listRepository.retrieveItemsStream,
    ).thenAnswer(
      (_) => Stream.value([
        const ListOfThings(
          name: 'first own list',
          type: ListType.activities,
          userId: 'user1',
        ),
        const ListOfThings(
          name: 'second own list',
          type: ListType.food,
          userId: 'user1',
        )
      ]),
    );
    when(
      sharedListRepository.retrieveItemsStream,
    ).thenAnswer(
      (_) => Stream.value([
        const ListOfThings(
          name: 'one shared list',
          type: ListType.movies,
          userId: 'user2',
        ),
        const ListOfThings(
          name: 'another shared list',
          type: ListType.restaurants,
          userId: 'user2',
        )
      ]),
    );
  });

  testWidgets('override repositoryProvider', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          listRepositoryProvider
              .overrideWith((ref) => Future.value(listRepository)),
          participatedListRepositoryProvider
              .overrideWith((ref) => Future.value(sharedListRepository))
        ],
        child: MaterialApp(
          home: Scaffold(
            body: Consumer(
              builder: (context, ref, _) {
                final lists = ref.watch(combinedListsProvider);
                if (lists.asData == null) {
                  return const CircularProgressIndicator();
                }
                // return Text(key: const Key('a'), '${lists.asData!.value}');
                return ListView(
                  children: [
                    for (final list in lists.asData!.value) Text(list.name)
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );

    // The first frame is a loading state.
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Re-render. TodoListProvider should have finished fetching the todos by now
    await tester.pumpAndSettle();

    // No longer loading
    expect(find.byType(CircularProgressIndicator), findsNothing);

    final expectedListItems = <String>[
      'first own list',
      'second own list',
      'one shared list',
      'another shared list',
    ];
    final listWidgets = tester
        .widgetList(find.byType(Text))
        .map((w) => (w as Text).data)
        .toList();
    expect(listWidgets, unorderedEquals(expectedListItems));
  });
}
