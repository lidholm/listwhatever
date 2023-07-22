import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:listanything/app/custom/geocoder/geocoderresult.dart';
import 'package:listanything/app/custom/geocoder/geometry.dart';
import 'package:listanything/app/custom/geocoder/latlong.dart';
import 'package:listanything/app/custom/pages/list_items/list_item.dart';
import 'package:listanything/app/custom/pages/list_items/list_items_repository_provider.dart';
import 'package:listanything/app/custom/pages/list_items/upsertListItem/upsert_list_item_form.dart';
import 'package:listanything/app/custom/pages/lists/list_of_things.dart';
import 'package:listanything/app/custom/pages/settings/settings.dart';
import 'package:listanything/app/standard/firebase/current_user.dart';
import 'package:listanything/app/standard/helpers/constants.dart';
import 'package:listanything/app/standard/navigation/current_user_provider.dart';
import 'package:listanything/app/standard/widgets/base_repository.dart';
import 'package:mocktail/mocktail.dart';

final mockFirestoreUser = CurrentUser(
  name: 'AA',
  uid: 'uid-1',
  email: 'uid-1-email@email.com',
  settings: Settings(
    distanceUnit: DistanceUnitType.miles,
    clockType: ClockType.TwentyFourHour,
    dateFormatType: DateFormatType.ISO_8601,
    readableDateFormatType: DateFormatType.MONTH_AND_DAY,
  ),
  isAdmin: false,
);

class MockBaseRepository<ListItem> extends Mock
    implements BaseRepository<ListItem> {}

class MockGoRouter extends Mock implements GoRouter {}

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

class UpsertTestHelpers {
  static MockBaseRepository<ListItem> mockListItemRepo =
      MockBaseRepository<ListItem>();

  static void setUpMockReturns() {
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
  }

  static Future<void> fillInName(WidgetTester tester, String name) async {
    return tester.enterText(
      find.byKey(UpsertListItemFormKeyConstants.nameFieldKey),
      name,
    );
  }

  static Future<void> fillInExtraInfo(WidgetTester tester, String info) async {
    return tester.enterText(
      find.byKey(UpsertListItemFormKeyConstants.infoFieldKey),
      info,
    );
  }

  static Future<void> fillInUrls(WidgetTester tester, List<String> urls) async {
    for (final entry in urls.asMap().entries) {
      final index = entry.key;
      final url = entry.value;
      if (find
          .byKey(UpsertListItemFormKeyConstants.getUrlFieldKey(index))
          .evaluate()
          .isEmpty) {
        await tester
            .tap(find.byKey(UpsertListItemFormKeyConstants.addUrlButtonKey));
        await tester.pumpAndSettle();
      }
      await tester.enterText(
        find.byKey(UpsertListItemFormKeyConstants.getUrlFieldKey(index)),
        url,
      );
    }
  }

  static Future<void> fillInCategories(
    WidgetTester tester,
    Map<String, List<String>> categories,
  ) async {
    var index = 0;
    for (final entry in categories.entries) {
      final categoryName = entry.key;
      final categoryValues = entry.value;

      if (find
          .byKey(UpsertListItemFormKeyConstants.getCategoryNameFieldKey(index))
          .evaluate()
          .isEmpty) {
        await tester.tap(
          find.byKey(UpsertListItemFormKeyConstants.addCategoryButtonKey),
        );
        await tester.pumpAndSettle();
      }
      await tester.enterText(
        find.byKey(
          UpsertListItemFormKeyConstants.getCategoryNameFieldKey(index),
        ),
        categoryName,
      );
      await tester.enterText(
        find.byKey(
          UpsertListItemFormKeyConstants.getCategoryValueFieldKey(index),
        ),
        categoryValues.join(', '),
      );
      index++;
    }
  }

  static Future<void> fillInDate(
    WidgetTester tester, {
    required String day,
    String? hour,
    String? minute,
  }) async {
    expect(
      find.byKey(UpsertListItemFormKeyConstants.dateFieldKey),
      findsOneWidget,
    );

    await tester.tap(
      find.byKey(UpsertListItemFormKeyConstants.dateFieldKey),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text(day));
    await tester.pumpAndSettle();
    await tester.tap(
      find.text('OK'),
    );
    await tester.pumpAndSettle();
    if (hour != null) {
      // TODO: Click on AM/PM if time before or after 12:00
      await tester.tap(find.text('AM'));
      await tester.pumpAndSettle();
      final center = tester
          .getCenter(find.byKey(const ValueKey<String>('time-picker-dial')));
      // TODO: calculate offset based on time
      await tester.tapAt(Offset(center.dx - 10, center.dy));
      await tester.pumpAndSettle();
      // TODO: calculate offset based on time
      await tester.tapAt(Offset(center.dx - 10, center.dy));
      await tester.pumpAndSettle();
      await tester.tap(
        find.text('OK'),
      );
      await tester.pumpAndSettle();
    }
  }

  static Future<void> searchForAddress(
    WidgetTester tester,
  ) async {
    await tester
        .tap(find.byKey(UpsertListItemFormKeyConstants.searchAddressButtonKey));
    await tester.pumpAndSettle();
  }

  static Future<void> clickSubmit(WidgetTester tester) async {
    await tester
        .tap(find.byKey(UpsertListItemFormKeyConstants.submitButtonKey));
    await tester.pumpAndSettle();
  }

  static Future<void> clickCancel(WidgetTester tester) async {
    await tester
        .tap(find.byKey(UpsertListItemFormKeyConstants.cancelButtonKey));
    await tester.pumpAndSettle();
  }

  static Future<void> clickDeleteButton(WidgetTester tester) async {
    await tester
        .tap(find.byKey(UpsertListItemFormKeyConstants.deleteButtonKey));
    await tester.pumpAndSettle();
  }

  static ListOfThings getList({
    bool withDates = false,
    bool withTimes = false,
    bool withMap = false,
  }) {
    return ListOfThings(
      name: 'b',
      type: ListType.other,
      userId: 'c',
      publicListId: 'pub123',
      withDates: withDates,
      withTimes: withTimes,
      withMap: withMap,
    );
  }

  static ListItem getListItem({
    String? id,
    String? name,
    Map<String, List<String>>? categories,
  }) {
    final now = DateTime.now();
    final month = now.month < 10 ? '0${now.month}' : '${now.month}';
    final date = DateTime.tryParse('${now.year}-$month-05 11:22:33');
    return ListItem(
      id: id,
      name: name ?? 'One list item',
      categories: categories ?? {},
      info: 'A little bit of information',
      address: '321 State street',
      latLong: const LatLong(lat: -9.8, lng: 7.65),
      datetime: date,
      urls: ['URL-1', '2nd url'],
    );
  }

  static void verifyNameHasText(WidgetTester tester, String text) {
    expect(
      UpsertListItemFormKeyConstants.formKey.currentState!
          .fields[UpsertListItemFormNameFieldConstants.nameField]!.value,
      text,
    );
  }

  static void verifyExtraInfoHasText(WidgetTester tester, String text) {
    expect(
      UpsertListItemFormKeyConstants.formKey.currentState!
          .fields[UpsertListItemFormNameFieldConstants.infoFieldName]!.value,
      text,
    );
  }

  static void verifyAddressHasText(WidgetTester tester, String text) {
    expect(
      UpsertListItemFormKeyConstants.formKey.currentState!
          .fields[UpsertListItemFormNameFieldConstants.addressFieldName]!.value,
      text,
    );
  }

  static void verifyLatitudeHasText(WidgetTester tester, String text) {
    expect(
      UpsertListItemFormKeyConstants.formKey.currentState!
          .fields[UpsertListItemFormNameFieldConstants.latFieldName]!.value,
      text,
    );
  }

  static void verifyLongitudeHasText(WidgetTester tester, String text) {
    expect(
      UpsertListItemFormKeyConstants.formKey.currentState!
          .fields[UpsertListItemFormNameFieldConstants.longFieldName]!.value,
      text,
    );
  }

  static void verifyDateHasText(WidgetTester tester, DateTime date) {
    final fields = UpsertListItemFormKeyConstants.formKey.currentState!.fields;
    expect(
      fields[UpsertListItemFormNameFieldConstants.dateTimeField]?.value,
      date,
    );
  }

  static void verifyUrlsHaveTexts(WidgetTester tester, List<String> urls) {
    final fields = UpsertListItemFormKeyConstants.formKey.currentState!.fields;
    for (final u in mapIndexed(urls)) {
      final index = u.key;
      final url = u.value;
      expect(
        fields[UpsertListItemFormNameFieldConstants.getUrlFieldName(index)]
            ?.value,
        url,
      );
    }
  }

  static void verifyCategoriesHaveTexts(
    WidgetTester tester,
    Map<String, List<String>> categories,
  ) {
    final fields = UpsertListItemFormKeyConstants.formKey.currentState!.fields;
    for (final u in mapIndexed(categories.entries)) {
      final index = u.key;
      final categoryName = u.value.key;
      final categoryValues = u.value.value.join(',');
      expect(
        fields[UpsertListItemFormNameFieldConstants.getCategoryNameFieldName(
          index,
        )]
            ?.value,
        categoryName,
      );
      expect(
        fields[UpsertListItemFormNameFieldConstants.getCategoryValueFieldName(
          index,
        )]
            ?.value,
        categoryValues,
      );
    }
  }

  static Override getCurrentUserRepoOverride(
    CurrentUser user,
  ) {
    return currentUserProvider.overrideWith((ref) => AsyncValue.data(user));
  }

  static Override getListItemRepoOverride(
    MockBaseRepository<ListItem> mockListItemRepo,
  ) {
    return listItemsRepositoryProvider
        .overrideWith((ref, arg) => Stream.value(mockListItemRepo));
  }

  static MockUpsertListItemForm getUpsertForm(
    ListOfThings list,
    ListItem? item,
  ) {
    return MockUpsertListItemForm(
      list: list,
      listItem: item,
    );
  }

  static ProviderScope getProviderScope(
    MockBaseRepository<ListItem> mockListItemRepo,
    MockUpsertListItemForm upsertForm,
    CurrentUser user,
  ) {
    return ProviderScope(
      overrides: [
        getListItemRepoOverride(mockListItemRepo),
        getCurrentUserRepoOverride(user),
      ],
      child: MaterialApp(home: upsertForm),
    );
  }
}
