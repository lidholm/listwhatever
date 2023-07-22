import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/app/custom/pages/list_items/filters.dart';

final filterProvider = StateProvider((ref) => Filters(categoryFilters: {}));
