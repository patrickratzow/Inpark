import "package:flutter/material.dart";

extension ThemeExtension on ThemeData {
  /// Returns the [Color] approriate for the [ThemeData]'s brightness
  Color adjustColor({
    required Color light,
    required Color dark,
  }) {
    return isLight ? light : dark;
  }

  @protected
  bool get isLight => brightness == Brightness.light;
}
