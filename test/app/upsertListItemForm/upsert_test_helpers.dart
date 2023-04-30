import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:listanything/app/geocoder/latlong.dart';
import 'package:listanything/app/helpers/constants.dart';
import 'package:listanything/app/pages/list_items/list_item.dart';
import 'package:listanything/app/pages/list_items/upsertListItem/upsert_list_item_form.dart';
import 'package:listanything/app/pages/lists/list_of_things.dart';

class UpsertTestHelpers {
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
      publicListId: 'asd',
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
    return ListItem(
      id: id,
      name: name ?? 'One list item',
      categories: categories ?? {},
      info: 'A little bit of information',
      address: '321 State street',
      latLong: const LatLong(lat: -9.8, lng: 7.65),
      datetime: DateTime.tryParse('2023-04-05 11:22:33'),
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
}
