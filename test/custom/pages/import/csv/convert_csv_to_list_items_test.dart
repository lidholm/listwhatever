import 'package:listwhatever/custom/pages/import/csv/convert_csv_to_list_items.dart';
import 'package:listwhatever/custom/pages/listItems/list_item.dart';
import 'package:listwhatever/custom/pages/listItems/searchLocation/geocoder/latlong.dart';
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
info,name,Color,difficulty
"Info, with a comma",Coronado Golf Course,"black, white",hard
"Sea N Air Golf Course, Coronado, CA",Sea N Air Golf Course,"red, blue, yellow",easy
    ''';

    final listItems = csvConverter.convert(csv);

    final expected = [
      const ListItem(
        id: null,
        name: 'Coronado Golf Course',
        info: 'Info, with a comma',
        categories: {'Color': ['black', 'white'], 'difficulty': ['hard']},
      ),
      const ListItem(
        id: null,
        name: 'Sea N Air Golf Course',
        info: 'Sea N Air Golf Course, Coronado, CA',
        categories: {'Color': ['red','blue','yellow'], 'difficulty': ['easy']},
      ),
    ];
    expect(listItems, expected);
  });

  test('Convert csv with only datetime, address, latLong,urls', () {
    final csvConverter = CsvConverter();

    const csv = '''
name,lat,long,address,datetime,urls
First item, 12.2,43.1,"2000 Visalia Row, CA 92118",2012-01-12,"http://url1.com, https://url2.com"
Second item, 65.3,65.8,"123 Main Street, CA 92260",2021-02-03 14:15:16,
    ''';

    final listItems = csvConverter.convert(csv);

    final expected = [
      ListItem(
        id: null,
        name: 'First item',
        datetime: DateTime(2012,01,12),
        address: '2000 Visalia Row, CA 92118',
        latLong: const LatLong(lat: 12.2, lng: 43.1),
        urls: ['http://url1.com', 'https://url2.com'],
      ),
      ListItem(
        id: null,
        name: 'Second item',
        datetime: DateTime(2021,02,03,14,15,16),
        address: '123 Main Street, CA 92260',
        latLong: const LatLong(lat: 65.3, lng: 65.8),
      ),
    ];
    expect(listItems, expected);
  });
}
