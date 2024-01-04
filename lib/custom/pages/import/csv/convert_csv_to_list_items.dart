import 'package:csv/csv.dart';
import 'package:listwhatever/custom/firestore/listItems/list_item.dart';

enum Keywords {
  name,
  info,
  datetime,
  address,
  latlong,
}

class CsvConverter {
  List<ListItem> convert(String csv) {
    final rows = const CsvToListConverter(
        eol: '\n',
      textEndDelimiter: '"',
    ).convert(csv);
    final listItems = <ListItem>[];

    final headers = rows[0].map((x) => (x as String).trim()).toList();
    final rest = rows.skip(1);
    final headerPositions = getHeaderPositions(headers);
    print('headerPositions: $headerPositions');

    for (final row in rest) {
      if (row.isEmpty || (row.length == 1 && (row[0] as String).trim() == '')) {
        continue;
      }
      final listItem = ListItem(
        id: null,
        name: getRowValue(row, headerPositions, Keywords.name)!,
        info: getRowValue(row, headerPositions, Keywords.info),
        categories: getCategories(row, headerPositions),
      );

      listItems.add(listItem);
    }

    return listItems;
  }

  String? getRowValue(List<dynamic> row, Map<String, int> headerPositions, Keywords keyword) {
    if (headerPositions[keyword.name] == null) {
      return null;
    }
    final index = headerPositions[keyword.name];
    final value = row[index!] as String;
    return value.trim();
  }

  Map<String, int> getHeaderPositions(List<dynamic> headers) {
    final headerPositions = <String, int>{};

    for (final tmp in headers) {
      final header = (tmp as String).trim();
      final matchingKeyword = getMatchingKeyword(header);
      if (matchingKeyword != null) {
        headerPositions[matchingKeyword] = headers.indexOf(header);
      } else {
        headerPositions[header] = headers.indexOf(header);
      }
    }
    return headerPositions;
  }

  String? getMatchingKeyword(String header) {
    for (final keyword in Keywords.values) {
      final keywordName = keyword.name;
      final headerName = header.toLowerCase();
      if (keywordName == headerName) {
        return keyword.name.toLowerCase();
      }
    }
    print('$header is not matching a keyword');
    return null;
  }

  Map<String, List<String>> getCategories(List<dynamic> row, Map<String, int> headerPositions) {
    final otherHeaders = getCategoryHeaders(headerPositions);
    final categories = <String, List<String>>{};

    for (final header in otherHeaders.entries) {
      final categoryValues = (row[header.value] as String).split(',');
        categories[header.key] = categoryValues.map((e) => e.trim()).toList();
    }

    return categories;
  }

  Map<String, int> getCategoryHeaders(Map<String, int> headerPositions) {
    final headers = <String, int>{};
    final keywordValues = Keywords.values.map((e) => e.name.toLowerCase());

    for (final headerPosition in headerPositions.entries) {
      if (!keywordValues.contains(headerPosition.key)) {
        headers[headerPosition.key] = headerPosition.value;
      }
    }
    return headers;
  }
}
