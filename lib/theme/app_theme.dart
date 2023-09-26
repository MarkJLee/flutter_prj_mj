import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

// Theme config for FlexColorScheme version 7.3.x. Make sure you use
// same or higher package version, but still same major version. If you
// use a lower package version, some properties may not be supported.
// In that case remove them after copying this theme to your app.

final lightTheme = FlexThemeData.light(
  scheme: FlexScheme.purpleM3,
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  blendLevel: 7,
  appBarStyle: FlexAppBarStyle.custom,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 10,
    blendOnColors: false,
    useTextTheme: true,
    useM2StyleDividerInM3: true,
    alignedDropdown: true,
    useInputDecoratorThemeInDialogs: true,
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  swapLegacyOnMaterial3: true,
  // To use the Playground font, add GoogleFonts package and uncomment
  // fontFamily: GoogleFonts.notoSans().fontFamily,
);

final darkTheme = FlexThemeData.dark(
  scheme: FlexScheme.purpleM3,
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  blendLevel: 13,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 20,
    useTextTheme: true,
    useM2StyleDividerInM3: true,
    alignedDropdown: true,
    useInputDecoratorThemeInDialogs: true,
  ),
  // colorScheme: flexSchemeDark,
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  swapLegacyOnMaterial3: true,
  // To use the Playground font, add GoogleFonts package and uncomment
  // fontFamily: GoogleFonts.notoSans().fontFamily,
);

// Light and dark ColorSchemes made by FlexColorScheme v7.3.1.
// These ColorScheme objects require Flutter 3.7 or later.
const ColorScheme flexSchemeLight = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xff9a25ae),
  onPrimary: Color(0xffffffff),
  primaryContainer: Color(0xffffd6fe),
  onPrimaryContainer: Color(0xff141214),
  secondary: Color(0xff8728cf),
  onSecondary: Color(0xffffffff),
  secondaryContainer: Color(0xfff2daff),
  onSecondaryContainer: Color(0xff141214),
  tertiary: Color(0xff934932),
  onTertiary: Color(0xffffffff),
  tertiaryContainer: Color(0xffffdbd0),
  onTertiaryContainer: Color(0xff141211),
  error: Color(0xffba1a1a),
  onError: Color(0xffffffff),
  errorContainer: Color(0xffffdad6),
  onErrorContainer: Color(0xff141212),
  background: Color(0xfffcf9fc),
  onBackground: Color(0xff090909),
  surface: Color(0xfffcf9fc),
  onSurface: Color(0xff090909),
  surfaceVariant: Color(0xffe9e2ea),
  onSurfaceVariant: Color(0xff121112),
  outline: Color(0xff7c7c7c),
  outlineVariant: Color(0xffc8c8c8),
  shadow: Color(0xff000000),
  scrim: Color(0xff000000),
  inverseSurface: Color(0xff141115),
  onInverseSurface: Color(0xfff5f5f5),
  inversePrimary: Color(0xffffbeff),
  surfaceTint: Color(0xff9a25ae),
);

const ColorScheme flexSchemeDark = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xfff9abff),
  onPrimary: Color(0xff141114),
  primaryContainer: Color(0xff7b008f),
  onPrimaryContainer: Color(0xfff3dff6),
  secondary: Color(0xffe0b6ff),
  onSecondary: Color(0xff141214),
  secondaryContainer: Color(0xff6b00af),
  onSecondaryContainer: Color(0xfff0dffb),
  tertiary: Color(0xffffb59f),
  onTertiary: Color(0xff141210),
  tertiaryContainer: Color(0xff76331d),
  onTertiaryContainer: Color(0xfff2e7e4),
  error: Color(0xffffb4ab),
  onError: Color(0xff141211),
  errorContainer: Color(0xff93000a),
  onErrorContainer: Color(0xfff6dfe1),
  background: Color(0xff1c181d),
  onBackground: Color(0xffedeced),
  surface: Color(0xff1c181d),
  onSurface: Color(0xffedeced),
  surfaceVariant: Color(0xff463e46),
  onSurfaceVariant: Color(0xffe1e0e1),
  outline: Color(0xff7d767d),
  outlineVariant: Color(0xff2e2c2e),
  shadow: Color(0xff000000),
  scrim: Color(0xff000000),
  inverseSurface: Color(0xfffefaff),
  onInverseSurface: Color(0xff131314),
  inversePrimary: Color(0xff765877),
  surfaceTint: Color(0xfff9abff),
);
