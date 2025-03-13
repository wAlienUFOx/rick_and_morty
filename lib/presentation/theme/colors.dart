import 'package:flutter/material.dart';
import 'custom_theme.dart';

class ColorsTheme {
  const ColorsTheme._();

  static ColorsTheme get light => const ColorsTheme._();

  static ColorsTheme get dark => const DarkColorsTheme._();

  static ColorsTheme getThemeFromKey(AppTheme appTheme) {
    switch (appTheme) {
      case AppTheme.dark:
        return dark;
      default:
        return light;
    }
  }

  static ColorsTheme of(BuildContext context) {
    final themeColor = CustomTheme.of(context);
    switch (themeColor.theme) {
      case AppTheme.dark:
        return dark;
      default:
        return light;
    }
  }

  AppTheme get theme => AppTheme.light;

  Color get primaryBG => const Color(0xFFFFFFFF);
  Color get secondaryBG => const Color(0xFFF2F2F2);

  Color get primaryText => const Color(0xFF161616);
  Color get secondaryText => const Color(0x993C3C43);
  Color get accentText => const Color(0xFFFD5003);
  Color get primaryInvertedText => const Color(0xFFFFFFFF);

  Color get positive => const Color(0xFF2FC26E);
  Color get negative => const Color(0xFFF15045);

  Color get primarySF => const Color(0xFFFD5003);
  Color get primaryPressedSF => const Color(0xFFFF6521);
  Color get primaryInactiveSF => const Color(0xFFFFEEE6);
  Color get secondarySF => const Color(0xFF333333);
  Color get secondaryPressedSF => const Color(0xFF656565);
  Color get secondaryInactiveSF => const Color(0xFFF6F5F4);

  Color get primaryBorder => const Color(0xFFFFFFFF);
  Color get secondaryBorder => const Color(0xFFA2A2A2);
  Color get accentBorder => const Color(0xFFFD5003);

  Color get accentIcon => const Color(0xFFFD5003);
  Color get primaryInvertedIcon => const Color(0xFFFFFFFF);
  Color get primaryIcon => const Color(0xFF161616);
  Color get secondaryIcon => const Color(0x663C3C43);
}

class DarkColorsTheme implements ColorsTheme {
  const DarkColorsTheme._();

  @override
  AppTheme get theme => AppTheme.dark;

  @override
  Color get primaryBG => const Color(0xFFFFFFFF);
  @override
  Color get secondaryBG => const Color(0xFFF2F2F2);

  @override
  Color get primaryText => const Color(0xFF161616);
  @override
  Color get secondaryText => const Color(0x993C3C43);
  @override
  Color get accentText => const Color(0xFFFD5003);
  @override
  Color get primaryInvertedText => const Color(0xFFFFFFFF);

  @override
  Color get positive => const Color(0xFF2FC26E);
  @override
  Color get negative => const Color(0xFFF15045);

  @override
  Color get primarySF => const Color(0xFFFD5003);
  @override
  Color get primaryPressedSF => const Color(0xFFFF6521);
  @override
  Color get primaryInactiveSF => const Color(0xFFFFEEE6);
  @override
  Color get secondarySF => const Color(0xFF333333);
  @override
  Color get secondaryPressedSF => const Color(0xFF656565);
  @override
  Color get secondaryInactiveSF => const Color(0xFFF6F5F4);

  @override
  Color get primaryBorder => const Color(0xFFFFFFFF);
  @override
  Color get secondaryBorder => const Color(0xFFA2A2A2);
  @override
  Color get accentBorder => const Color(0xFFFD5003);

  @override
  Color get accentIcon => const Color(0xFFFD5003);
  @override
  Color get primaryInvertedIcon => const Color(0xFFFFFFFF);
  @override
  Color get primaryIcon => const Color(0xFF161616);
  @override
  Color get secondaryIcon => const Color(0x663C3C43);
}
