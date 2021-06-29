import 'package:flutter/material.dart';

class ApplicationTheme {
  static Color _lightBackgroundColor = Color(0xFFf1f2f2);
  static Color _lightPrimaryColor = Color(0xFFf1f2f2);
  static Color _lightAccentColor = Colors.blueGrey.shade200;

  static Color _darkBackgroundColor = Color(0xFF1a2127);
  static Color _darkPrimaryColor = Color(0xFF1a2127);
  static Color _darkAccentColor = Colors.blueGrey.shade600;

  final lightTheme = ThemeData(
      brightness: Brightness.light,
      backgroundColor: _lightBackgroundColor,
      primaryColor: _lightPrimaryColor,
      accentColor: _lightAccentColor,
      visualDensity: VisualDensity.adaptivePlatformDensity
    );

  final darkTheme = ThemeData(
      brightness: Brightness.dark,
      backgroundColor: _darkBackgroundColor,
      primaryColor: _darkPrimaryColor,
      accentColor: _darkAccentColor,
      visualDensity: VisualDensity.adaptivePlatformDensity
  );
}

extension ThemeExtensions on ThemeData {
  static Color _lightParticlesColor = Color(0x44948282);
  static Color _darkParticlesColor = Color(0x441c2a3d);

  Color get particlesColor => this.brightness == Brightness.light
      ? _lightParticlesColor
      : _darkParticlesColor;
}
