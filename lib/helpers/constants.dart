import 'dart:math';

enum Side {
  left._('left'),
  right._('rights');

  const Side._(this.value);

  final String value;
}

Iterable<(int, T)> mapIndexed<T>(
  Iterable<T> items,
) sync* {
  var index = 0;

  for (final item in items) {
    yield (index, item);
    index = index + 1;
  }
}

const _chars = 'AaBbCcDdEeFfGgHhiJjKkLMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length)),
      ),
    );
