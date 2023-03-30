// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'share_code.freezed.dart';
part 'share_code.g.dart';

@freezed
class ShareCode with _$ShareCode {
  const factory ShareCode({
    required String path,
    required String shareCode,
    required List<String> users,
    required String userId,
    required String listId,
  }) = _ShareCode;

  factory ShareCode.fromJson(Map<String, dynamic> json) => _$ShareCodeFromJson(json);
}
