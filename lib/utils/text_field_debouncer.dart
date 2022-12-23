import 'package:flutter/foundation.dart';
import 'dart:async';

class TextFieldDebounder {
  int? milliseconds;
  Timer? _timer;

  TextFieldDebounder({this.milliseconds});

  run(VoidCallback action) {
    if (_timer != null) {
      _timer?.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds ?? 0), action);
  }
}
