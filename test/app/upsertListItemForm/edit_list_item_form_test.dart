import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:listanything/app/geocoder/geocoderresult.dart';
import 'package:listanything/app/geocoder/geometry.dart';
import 'package:listanything/app/geocoder/latlong.dart';
import 'package:listanything/app/pages/list_items/list_item.dart';
import 'package:listanything/app/pages/list_items/list_items_repository_provider.dart';
import 'package:listanything/app/pages/list_items/upsertListItem/upsert_list_item_form.dart';
import 'package:listanything/app/pages/lists/list_of_things.dart';
import 'package:listanything/app/widgets/standardWidgets/base_repository.dart';

import 'package:mocktail/mocktail.dart';

import 'upsert_test_helpers.dart';

class MockGoRouter extends Mock implements GoRouter {}

class MockBaseRepository<ListItem> extends Mock
    implements BaseRepository<ListItem> {}

class MockGeocoderResult extends Mock implements GeocoderResult {}

class MockGeometry extends Mock implements Geometry {}

class MockLatLong extends Mock implements LatLong {}

final mockGeocoderResult = MockGeocoderResult();
final mockGeometry = MockGeometry();
final mockLatLong = MockLatLong();
final mockGoRouter = MockGoRouter();

class MockUpsertListItemForm extends UpsertListItemForm {
  const MockUpsertListItemForm({
    required super.listItem,
    required super.list,
    super.key,
  });

  @override
  GoRouter getGoRouter(BuildContext context) {
    return mockGoRouter;
  }

  @override
  Future<MockGeocoderResult> addSearchLocation(
    BuildContext context,
    String? searchPhrase,
    String publicListId,
    String listItemId,
  ) {
    return Future.value(mockGeocoderResult);
  }

  @override
  Future<MockGeocoderResult> editSearchLocation(
    BuildContext context,
    String? searchPhrase,
    String publicListId,
    String listItemId,
  ) {
    return Future.value(mockGeocoderResult);
  }
}

void main() {
  late MockBaseRepository<ListItem> mockListItemRepo;

  setUpAll(() {
    registerFallbackValue(const ListItem(categories: {}, name: 't', id: 'y'));
  });

  setUp(() {
    mockListItemRepo = MockBaseRepository<ListItem>();
    when(mockGoRouter.pop).thenReturn(null);

    when(
      () => mockListItemRepo.createItem(
        item: any(named: 'item'),
      ),
    ).thenAnswer((_) => Future.value('something'));

    when(
      () => mockListItemRepo.updateItem(
        itemId: any(named: 'itemId'),
        item: any(named: 'item'),
      ),
    ).thenAnswer((_) => Future.value('something'));

    when(
      () => mockListItemRepo.deleteItem(
        itemId: any(named: 'itemId'),
      ),
    ).thenAnswer((_) => Future.value());
  });

  testWidgets('EditListItemForm shows fields with values of the ListItem',
      (tester) async {
    // Would probably be better if we could scroll to find the submit button
    tester.binding.window.physicalSizeTestValue = const Size(60000, 42000);

    await tester.pumpWidget(
      getProviderScope(
        mockListItemRepo,
        getUpsertForm(
          UpsertTestHelpers.getList(withDates: true, withMap: true),
          UpsertTestHelpers.getListItem(
            categories: {
              'type1': ['aaa'],
              'type2': ['Bob', 'Coldcuts']
            },
          ),
        ),
      ),
    );

    UpsertTestHelpers.verifyNameHasText(tester, 'One list item');
    UpsertTestHelpers.verifyExtraInfoHasText(
      tester,
      'A little bit of information',
    );
    UpsertTestHelpers.verifyAddressHasText(tester, '321 State street');
    UpsertTestHelpers.verifyLatitudeHasText(tester, '-9.8');
    UpsertTestHelpers.verifyLongitudeHasText(tester, '7.65');
    UpsertTestHelpers.verifyDateHasText(
      tester,
      DateTime.tryParse('2023-04-05 11:22:33')!,
    );
    UpsertTestHelpers.verifyUrlsHaveTexts(tester, ['URL-1', '2nd url']);
    UpsertTestHelpers.verifyCategoriesHaveTexts(tester, {
      'type1': ['aaa'],
      'type2': ['Bob', 'Coldcuts']
    });
  });

  testWidgets('EditListItemForm can be updated', (tester) async {
    // Would probably be better if we could scroll to find the submit button
    tester.binding.window.physicalSizeTestValue = const Size(60000, 42000);

    await tester.pumpWidget(
      getProviderScope(
        mockListItemRepo,
        getUpsertForm(
          UpsertTestHelpers.getList(
            withDates: true,
            withTimes: true,
            withMap: true,
          ),
          UpsertTestHelpers.getListItem(
            id: 'id123',
            categories: {
              'type1': ['aaa'],
              'type2': ['Bob', 'Coldcuts']
            },
          ),
        ),
      ),
    );

    when(() => mockGeocoderResult.formattedAddress)
        .thenAnswer((invocation) => '123 Main street');

    when(() => mockGeocoderResult.geometry)
        .thenAnswer((invocation) => mockGeometry);

    when(() => mockGeometry.location).thenAnswer((invocation) => mockLatLong);
    when(() => mockLatLong.lat).thenAnswer((invocation) => 12.3);
    when(() => mockLatLong.lng).thenAnswer((invocation) => 45.6);

    await UpsertTestHelpers.fillInName(tester, 'Place one');
    await UpsertTestHelpers.fillInExtraInfo(tester, 'Some information');
    await UpsertTestHelpers.fillInUrls(tester, [
      'https://url1.com',
      'https://otherurl.se',
    ]);
    await UpsertTestHelpers.fillInCategories(
      tester,
      {
        'categoryA': [
          'categoryA1',
          'categoryA2',
        ],
        'categoryB': [
          'categoryB1',
          'categoryB2',
        ]
      },
    );
    await UpsertTestHelpers.searchForAddress(tester);
    await UpsertTestHelpers.fillInDate(
      tester,
      day: '27',
      hour: '9',
      minute: '45',
    );

    await UpsertTestHelpers.clickSubmit(tester);

    final now = DateTime.now();
    final expectedListItem = ListItem(
      id: 'id123',
      name: 'Place one',
      info: 'Some information',
      categories: {
        'categoryA': [
          'categoryA1',
          'categoryA2',
        ],
        'categoryB': [
          'categoryB1',
          'categoryB2',
        ]
      },
      urls: [
        'https://url1.com',
        'https://otherurl.se',
      ],
      address: '123 Main street',
      latLong: const LatLong(
        lat: 12.3,
        lng: 45.6,
      ),
      datetime: DateTime(now.year, now.month, 27, 9, 45),
    );
    final captured = verify(
      () => mockListItemRepo.updateItem(
        itemId: 'id123',
        item: captureAny(named: 'item'),
      ),
    ).captured;
    expect(captured.last as ListItem, expectedListItem);

    verify(mockGoRouter.pop).called(1);
  });

  testWidgets('EditListItemForm can delete ListItem', (tester) async {
    // Would probably be better if we could scroll to find the submit button
    tester.binding.window.physicalSizeTestValue = const Size(60000, 42000);

    await tester.pumpWidget(
      getProviderScope(
        mockListItemRepo,
        getUpsertForm(
          UpsertTestHelpers.getList(),
          UpsertTestHelpers.getListItem(id: 'id123'),
        ),
      ),
    );

    await UpsertTestHelpers.clickDeleteButton(tester);

    verify(
      () => mockListItemRepo.deleteItem(
        itemId: 'id123',
      ),
    ).called(1);

    verify(mockGoRouter.pop).called(1);
  });
}

Override getListItemRepoOverride(
  MockBaseRepository<ListItem> mockListItemRepo,
) {
  return listItemsRepositoryProvider
      .overrideWith((ref, arg) => Stream.value(mockListItemRepo));
}

MockUpsertListItemForm getUpsertForm(ListOfThings list, ListItem? item) {
  return MockUpsertListItemForm(
    list: list,
    listItem: item,
  );
}

ProviderScope getProviderScope(
  MockBaseRepository<ListItem> mockListItemRepo,
  MockUpsertListItemForm upsertForm,
) {
  return ProviderScope(
    overrides: [
      getListItemRepoOverride(mockListItemRepo),
    ],
    child: MaterialApp(home: upsertForm),
  );
}
