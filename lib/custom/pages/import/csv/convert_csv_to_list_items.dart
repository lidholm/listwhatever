import 'package:csv/csv.dart';
import '/custom/pages/listItems/models/list_item.dart';

import '/custom/pages/listItems/searchLocation/geocoder/latlong.dart';
import '/standard/constants.dart';

enum Keywords {
  name,
  info,
  datetime,
  address,
  lat,
  long,
  urls,
}

class CsvConverter {
  List<ListItem> convert(String csv) {
    final rows = const CsvToListConverter(
      eol: '\n',
      textEndDelimiter: '"',
    ).convert(csv.trim());
    final listItems = <ListItem>[];

    final headers = rows[0].map((x) => (x as String).trim()).toList();
    final rest = rows.skip(1);
    final headerPositions = getHeaderPositions(headers);
    logger.i('$this => headerPositions: $headerPositions');

    for (final row in rest) {
      if (row.isEmpty || (row.length == 1 && (row[0] as String).trim() == '')) {
        continue;
      }
      LatLong? latlong;
      final lat = getRowValue(row, headerPositions, Keywords.lat);
      final lng = getRowValue(row, headerPositions, Keywords.long);
      if (lat != null && lng != null) {
        try {
          latlong = LatLong(lat: double.parse(lat), lng: double.parse(lng));
        } catch (e) {
          logger
            ..e("Can't parse latlong: $e, $row")
            ..i("Can't parse latlong: $e, $row");
        }
      }
      final listItem = ListItem(
        id: null,
        name: getRowValue(row, headerPositions, Keywords.name)!,
        info: getRowValue(row, headerPositions, Keywords.info),
        datetime: DateTime.tryParse(getRowValue(row, headerPositions, Keywords.datetime) ?? ''),
        address: getRowValue(row, headerPositions, Keywords.address),
        latLong: latlong,
        urls: getUrls(row, headerPositions),
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
    final value = row[index!].toString();
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
    logger.i('$this => $header is not matching a keyword');
    return null;
  }

  Map<String, List<String>> getCategories(List<dynamic> row, Map<String, int> headerPositions) {
    final otherHeaders = getCategoryHeaders(headerPositions);
    final categories = <String, List<String>>{};

    for (final header in otherHeaders.entries) {
      final value = row[header.value];
      final stringValue = value.toString();
      final splits = stringValue.split(',');
      final categoryValues = splits;
      categories[header.key] = categoryValues.map((e) => e.trim()).toList();
    }

    return categories;
  }

  List<String> getUrls(List<dynamic> row, Map<String, int> headerPositions) {
    if (!headerPositions.containsKey(Keywords.urls.name)) {
      return List.empty();
    }

    final value = row[headerPositions[Keywords.urls.name]!];
    final stringValue = value.toString().trim();
    if (stringValue == '') {
      return List.empty();
    }

    final splits = stringValue.split(',');
    return splits.map((e) => e.trim()).toList();
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
