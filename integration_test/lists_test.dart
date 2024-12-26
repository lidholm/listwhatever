import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:listwhatever/app/view/app.dart';
import 'package:listwhatever/components/shimmer/shimmer_loading.dart';
import 'package:listwhatever/pages/lists/components/user_list_tile.dart';
import 'package:listwhatever/pages/lists/models/user_list.dart';
import 'package:mocktail/mocktail.dart';

import 'mock_data.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    late MockData mockData;

    setUp(() {
      mockData = MockData();
    });

    testWidgets('verify that shimmers show up', (tester) async {
      await tester.pumpWidget(
        App(
          authRepository: mockData.authRepository,
          userListRepository: mockData.userListRepository,
          listRepository: mockData.listRepository,
          listItemRepository: mockData.listItemRepository,
          key: const Key('appkey'),
        ),
      );
      // await tester.pump(const Duration(milliseconds: 1));

      final tile1 = find.text('First list');
      expect(tile1, findsNothing);

      final userListTiles = find.byType(UserListTile);
      expect(userListTiles, findsExactly(4));

      final shimmers = find.byType(ShimmerLoading);
      expect(shimmers, findsExactly(4 * 3));
    });

    testWidgets('verify that list of UserLists show up', (tester) async {
      await tester.pumpWidget(
        App(
          authRepository: mockData.authRepository,
          userListRepository: mockData.userListRepository,
          listRepository: mockData.listRepository,
          listItemRepository: mockData.listItemRepository,
          key: const Key('appkey'),
        ),
      );
      await tester.pump(const Duration(milliseconds: 300));

      final tile1 = find.text('First list');
      expect(tile1, findsOneWidget);

      final tile2 = find.text('Second list');
      expect(tile2, findsOneWidget);
    });
  });
}
