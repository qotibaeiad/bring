import 'package:flutter/widgets.dart';

class Dimension {
  // Constants for default dimensions
  static const double defaultPadding = 16.0;
  static const double defaultFontSize = 16.0;
  // Screen size information
  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;
  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  // Responsive padding based on screen width
  static double getResponsivePadding(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 600) {
      return defaultPadding / 2; // Small screens
    } else if (screenWidth < 1200) {
      return defaultPadding; // Medium screens
    } else {
      return defaultPadding * 2; // Large screens
    }
  }

  // Responsive font size based on screen width
  static double getResponsiveFontSize(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 600) {
      return defaultFontSize - 2; // Small screens
    } else if (screenWidth < 1200) {
      return defaultFontSize; // Medium screens
    } else {
      return defaultFontSize + 2; // Large screens
    }
  }
}
