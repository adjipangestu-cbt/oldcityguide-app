import 'package:flutter/widgets.dart';

extension WidgetExtension on Widget {
  Widget pading(EdgeInsets padding) {
    return Padding(padding: padding, child: this);
  }
}
