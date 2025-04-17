// lib/Pages/responsive.dart

import 'package:flutter/widgets.dart';

class Responsive {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;

  // Define your design reference dimensions (modify these values as needed)
  static const double referenceWidth = 375.0;
  static const double referenceHeight = 812.0;

  /// Call this method in your top widget to initialize dimensions.
  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
  }

  /// Returns a responsive width based on the design's width reference.
  static double scaleWidth(double width) {
    return (width / referenceWidth) * screenWidth;
  }

  /// Returns a responsive height based on the design's height reference.
  static double scaleHeight(double height) {
    return (height / referenceHeight) * screenHeight;
  }
}

/// Extension getters on num to allow shorthand responsive sizing.
/// Now you can use 20.rw for a responsive width and 20.rh for a responsive height.
extension ResponsiveExtension on num {
  double get rw => Responsive.scaleWidth(toDouble());
  double get rh => Responsive.scaleHeight(toDouble());
}

