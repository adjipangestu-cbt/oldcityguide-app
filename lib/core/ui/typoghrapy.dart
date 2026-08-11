import 'package:flutter/cupertino.dart';

class AppTypoghrapy {
  static final TextStyle _base = TextStyle(fontFamily: 'PlusJakartaSans');
  static final TextStyle title = _base.copyWith(
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );
  static final TextStyle subTitle = _base.copyWith(
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );
  static final TextStyle regular = _base;
}
