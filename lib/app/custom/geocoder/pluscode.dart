// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'pluscode.freezed.dart';
part 'pluscode.g.dart';

@freezed
class PlusCode with _$PlusCode {
  factory PlusCode({
    @JsonKey(name: 'compound_code') required String compoundCode,
    @JsonKey(name: 'global_code') required String globalCode,
  }) = _PlusCode;

  factory PlusCode.fromJson(Map<String, dynamic> json) => _$PlusCodeFromJson(json);
}
