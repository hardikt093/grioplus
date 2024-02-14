import 'package:flutter/material.dart';

extension DoubleExtension on int {
  /// Vertical Spaced SizedBox
  Widget get toVSB {
    return SizedBox(height: toDouble());
  }

  /// Horizontal Spaced SizedBox
  Widget get toHSB {
    return SizedBox(width: toDouble());
  }

  /// Vertical EdgeInsets
  EdgeInsets get toVertical {
    return EdgeInsets.symmetric(vertical: toDouble());
  }

  /// Horizontal EdgeInsets
  EdgeInsets get toHorizontal {
    return EdgeInsets.symmetric(horizontal: toDouble());
  }

  /// All Circular BorderRadius
  BorderRadius get toAllBorderRadius {
    return BorderRadius.all(Radius.circular(toDouble()));
  }

  /// Horizontal EdgeInsets
  Radius get toRadius {
    return Radius.circular(toDouble());
  }
}
