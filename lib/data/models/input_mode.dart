import 'package:json_annotation/json_annotation.dart';

enum InputMode {
  @JsonValue('available')
  available,
  @JsonValue('unavailable')
  unavailable,
}
