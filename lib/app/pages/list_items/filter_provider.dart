import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listanything/app/pages/list_items/filters.dart';

final filterProvider = StateProvider((ref) => Filters(categoryFilters: {}));
