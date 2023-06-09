// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:listanything/app/geocoder/latlong.dart';
import 'package:listanything/app/pages/list_items/list_item.dart';
import 'package:listanything/app/pages/list_items/upsertListItem/upsert_list_item_form.dart';

import 'package:mocktail/mocktail.dart';

import 'upsert_test_helpers.dart';

void main() {
  setUpAll(() {
    registerFallbackValue(const ListItem(categories: {}, name: 't', id: 'y'));
  });

  setUp(() {
    when(mockGoRouter.pop).thenReturn(null);

    when(
      () => UpsertTestHelpers.mockListItemRepo.createItem(
        item: any(named: 'item'),
      ),
    ).thenAnswer((_) => Future.value('something'));
  });

  testWidgets(
      'AddListItemForm saves the correct item when only saving name and extra info',
      (tester) async {
    // Would probably be better if we could scroll to find the submit button
    tester.binding.window.physicalSizeTestValue = const Size(60000, 42000);

    await tester.pumpWidget(
      UpsertTestHelpers.getProviderScope(
        UpsertTestHelpers.mockListItemRepo,
        UpsertTestHelpers.getUpsertForm(UpsertTestHelpers.getList(), null),
        mockFirestoreUser,
      ),
    );

    await UpsertTestHelpers.fillInName(tester, 'Place one');
    await UpsertTestHelpers.fillInExtraInfo(tester, 'Some information');
    await UpsertTestHelpers.clickSubmit(tester);

    const expectedListItem = ListItem(
      name: 'Place one',
      info: 'Some information',
      categories: {},
    );
    final captured = verify(
      () => UpsertTestHelpers.mockListItemRepo
          .createItem(item: captureAny(named: 'item')),
    ).captured;
    expect(captured.last as ListItem, expectedListItem);

    verify(mockGoRouter.pop).called(1);
  });

  testWidgets('AddListItemForm saves the correct item with all basic data',
      (tester) async {
    // Would probably be better if we could scroll to find the submit button
    tester.binding.window.physicalSizeTestValue = const Size(60000, 42000);

    await tester.pumpWidget(
      UpsertTestHelpers.getProviderScope(
        UpsertTestHelpers.mockListItemRepo,
        UpsertTestHelpers.getUpsertForm(UpsertTestHelpers.getList(), null),
        mockFirestoreUser,
      ),
    );

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
    await UpsertTestHelpers.clickSubmit(tester);

    const expectedListItem = ListItem(
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
    );
    final captured = verify(
      () => UpsertTestHelpers.mockListItemRepo
          .createItem(item: captureAny(named: 'item')),
    ).captured;
    expect(captured.last as ListItem, expectedListItem);

    verify(mockGoRouter.pop).called(1);
  });

  testWidgets("AddListItemForm can't add date when list doesn't support it",
      (tester) async {
    // Would probably be better if we could scroll to find the submit button
    tester.binding.window.physicalSizeTestValue = const Size(60000, 42000);

    await tester.pumpWidget(
      UpsertTestHelpers.getProviderScope(
        UpsertTestHelpers.mockListItemRepo,
        UpsertTestHelpers.getUpsertForm(UpsertTestHelpers.getList(), null),
        mockFirestoreUser,
      ),
    );

    await UpsertTestHelpers.fillInName(tester, 'Place one');
    await UpsertTestHelpers.fillInExtraInfo(tester, 'Some information');

    expect(
      find.byKey(UpsertListItemFormKeyConstants.dateFieldKey),
      findsNothing,
    );
  });

  testWidgets('AddListItemForm saves the correct with date', (tester) async {
    // Would probably be better if we could scroll to find the submit button
    tester.binding.window.physicalSizeTestValue = const Size(60000, 42000);

    await tester.pumpWidget(
      UpsertTestHelpers.getProviderScope(
        UpsertTestHelpers.mockListItemRepo,
        UpsertTestHelpers.getUpsertForm(
          UpsertTestHelpers.getList(withDates: true),
          null,
        ),
        mockFirestoreUser,
      ),
    );

    await UpsertTestHelpers.fillInName(tester, 'Place one');
    await UpsertTestHelpers.fillInExtraInfo(tester, 'Some information');
    await UpsertTestHelpers.fillInDate(tester, day: '27');
    await UpsertTestHelpers.clickSubmit(tester);

    final now = DateTime.now();
    final expectedListItem = ListItem(
      name: 'Place one',
      info: 'Some information',
      categories: {},
      urls: [],
      datetime: DateTime(now.year, now.month, 27),
    );
    final captured = verify(
      () => UpsertTestHelpers.mockListItemRepo
          .createItem(item: captureAny(named: 'item')),
    ).captured;
    expect(captured.last as ListItem, expectedListItem);

    verify(mockGoRouter.pop).called(1);
  });

  testWidgets('AddListItemForm saves the correct with date and time',
      (tester) async {
    // Would probably be better if we could scroll to find the submit button
    tester.binding.window.physicalSizeTestValue = const Size(60000, 42000);

    await tester.pumpWidget(
      UpsertTestHelpers.getProviderScope(
        UpsertTestHelpers.mockListItemRepo,
        UpsertTestHelpers.getUpsertForm(
          UpsertTestHelpers.getList(withDates: true, withTimes: true),
          null,
        ),
        mockFirestoreUser,
      ),
    );

    await UpsertTestHelpers.fillInName(tester, 'Place one');
    await UpsertTestHelpers.fillInExtraInfo(tester, 'Some information');
    await UpsertTestHelpers.fillInDate(
      tester,
      day: '27',
      hour: '9',
      minute: '45',
    );
    await UpsertTestHelpers.clickSubmit(tester);

    final now = DateTime.now();
    final expectedListItem = ListItem(
      name: 'Place one',
      info: 'Some information',
      categories: {},
      urls: [],
      datetime: DateTime(now.year, now.month, 27, 9, 45),
    );
    final captured = verify(
      () => UpsertTestHelpers.mockListItemRepo
          .createItem(item: captureAny(named: 'item')),
    ).captured;
    expect(captured.last as ListItem, expectedListItem);

    verify(mockGoRouter.pop).called(1);
  });

  testWidgets('AddListItemForm saves the correct item with address',
      (tester) async {
    // Would probably be better if we could scroll to find the submit button
    tester.binding.window.physicalSizeTestValue = const Size(60000, 42000);

    when(() => mockGeocoderResult.formattedAddress)
        .thenAnswer((invocation) => '123 Main street');

    when(() => mockGeocoderResult.geometry)
        .thenAnswer((invocation) => mockGeometry);

    when(() => mockGeometry.location).thenAnswer((invocation) => mockLatLong);
    when(() => mockLatLong.lat).thenAnswer((invocation) => 12.3);
    when(() => mockLatLong.lng).thenAnswer((invocation) => 45.6);

    await tester.pumpWidget(
      UpsertTestHelpers.getProviderScope(
        UpsertTestHelpers.mockListItemRepo,
        UpsertTestHelpers.getUpsertForm(
          UpsertTestHelpers.getList(withMap: true),
          null,
        ),
        mockFirestoreUser,
      ),
    );

    await UpsertTestHelpers.fillInName(tester, 'Place one');
    await UpsertTestHelpers.fillInExtraInfo(tester, 'Some information');
    await UpsertTestHelpers.searchForAddress(tester);

    await UpsertTestHelpers.clickSubmit(tester);

    const expectedListItem = ListItem(
      name: 'Place one',
      info: 'Some information',
      categories: {},
      address: '123 Main street',
      latLong: LatLong(
        lat: 12.3,
        lng: 45.6,
      ),
    );
    final captured = verify(
      () => UpsertTestHelpers.mockListItemRepo
          .createItem(item: captureAny(named: 'item')),
    ).captured;
    expect(captured.last as ListItem, expectedListItem);

    verify(mockGoRouter.pop).called(1);
  });

  testWidgets("AddListItemForm doesn't save when cancel is clicked",
      (tester) async {
    // Would probably be better if we could scroll to find the submit button
    tester.binding.window.physicalSizeTestValue = const Size(60000, 42000);

    await tester.pumpWidget(
      UpsertTestHelpers.getProviderScope(
        UpsertTestHelpers.mockListItemRepo,
        UpsertTestHelpers.getUpsertForm(UpsertTestHelpers.getList(), null),
        mockFirestoreUser,
      ),
    );

    await UpsertTestHelpers.fillInName(tester, 'Place one');
    await UpsertTestHelpers.fillInExtraInfo(tester, 'Some information');
    await UpsertTestHelpers.clickCancel(tester);

    verifyNever(
      () => UpsertTestHelpers.mockListItemRepo
          .createItem(item: captureAny(named: 'item')),
    );
    verify(mockGoRouter.pop).called(1);
  });
}
