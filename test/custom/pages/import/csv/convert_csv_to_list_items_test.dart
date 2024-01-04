import 'package:listwhatever/custom/firestore/listItems/list_item.dart';
import 'package:listwhatever/custom/pages/import/csv/convert_csv_to_list_items.dart';
import 'package:test/test.dart';

void main() {
  test('get matching keyword', () {
    final csvConverter = CsvConverter();

    expect(
      csvConverter.getMatchingKeyword('name'),
      'name',
    );
    expect(
      csvConverter.getMatchingKeyword('info'),
      'info',
    );
    expect(
      csvConverter.getMatchingKeyword('Info'),
      'info',
    );
    expect(
      csvConverter.getMatchingKeyword('other'),
      null,
    );
  });

  test('get header positions', () {
    final csvConverter = CsvConverter();

    expect(
        csvConverter.getHeaderPositions(['name', 'datetime', 'info']),
        {'name': 0, 'info': 2, 'datetime': 1},
    );
    expect(
        csvConverter.getHeaderPositions([ 'DATETIME', 'Info', 'name']),
        {'name': 2, 'info': 1, 'datetime': 0},
    );

    expect(
        csvConverter.getHeaderPositions(['name', 'datetime', 'info','latlong','address','categoryOne','categoryTwo']),
        {'name': 0, 'info': 2, 'datetime': 1, 'latlong': 3, 'address': 4, 'categoryOne': 5, 'categoryTwo': 6},
    );
  });

  test('get categpry headers', () {
    final csvConverter = CsvConverter();

    expect(
      csvConverter.getCategoryHeaders( {'name': 0, 'Color':1, 'Size':2},),
      { 'Color':1, 'Size':2},
    );
  });

  test('Convert csv with only names', () {
    final csvConverter = CsvConverter();

    final csv = '''
          Name
          First item
          Second item
    '''.trim();

    final listItems = csvConverter.convert(csv);

    final expected = [
      const ListItem(
        id: null,
        name: 'First item',
      ),
      const ListItem(
        id: null,
        name: 'Second item',
      ),
    ];
    expect(listItems, expected);
  });

  test('Convert csv with names, info', () {
    final csvConverter = CsvConverter();

    final csv = '''
          Name, Info
          First item, hello
          Second item, hey
    '''.trim();

    final listItems = csvConverter.convert(csv);

    final expected = [
      const ListItem(
        id: null,
        name: 'First item',
        info: 'hello',
      ),
      const ListItem(
        id: null,
        name: 'Second item',
        info: 'hey',
      ),
    ];
    expect(listItems, expected);
  });

  test('Convert csv with only name, info, categories', () {
    final csvConverter = CsvConverter();

    const csv = '''
      Name, Info, Color, Size
      First item, Some info, red, small
      Second item, Some other info, blue, ""large,XL""
    ''';

    final listItems = csvConverter.convert(csv);

    final expected = [
      const ListItem(
        id: null,
        name: 'First item',
        info: 'Some info',
        categories: {'Color': ['red'], 'Size': ['small']},
      ),
      const ListItem(
        id: null,
        name: 'Second item',
        info: 'Some other info',
        categories: {'Color': ['blue'], 'Size': ['large', 'XL']},
      ),
    ];
    expect(listItems, expected);
  });
}
