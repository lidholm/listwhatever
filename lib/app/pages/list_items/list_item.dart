import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_item.freezed.dart';
part 'list_item.g.dart';

typedef CategoryName = String;
typedef CategoryValue = String;

@freezed
class ListItem with _$ListItem {
  factory ListItem({
    String? id,
    required String name,
    required Map<CategoryName, List<CategoryValue>> categories,
  }) = _ListItem;

  factory ListItem.fromJson(Map<String, dynamic> json) => _$ListItemFromJson(json);
}
