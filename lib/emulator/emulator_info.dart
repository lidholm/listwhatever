import 'package:freezed_annotation/freezed_annotation.dart';

part 'emulator_info.freezed.dart';

enum EmulatorType {
  none,
  localhost,
  ip,
}

@freezed
class EmulatorInfo with _$EmulatorInfo {
  factory EmulatorInfo({
    required EmulatorType type,
    required String? address,
  }) = _EmulatorInfo;
}
