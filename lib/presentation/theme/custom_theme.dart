import 'package:flutter/material.dart';
import 'colors.dart';

enum AppTheme {
  dark,
  light,
}

class CustomTheme extends InheritedWidget {
  final ColorsTheme colorsTheme;

  CustomTheme({
    super.key,
    required AppTheme appTheme,
    required super.child,
  }) : colorsTheme = ColorsTheme.getThemeFromKey(appTheme);

  @override
  bool updateShouldNotify(CustomTheme oldWidget) {
    return colorsTheme != oldWidget.colorsTheme;
  }

  static ColorsTheme of(BuildContext context) {
    final CustomTheme? result = context.dependOnInheritedWidgetOfExactType<CustomTheme>();
    assert(result != null, 'No MyThemeInheritedWidget found in context');
    return result!.colorsTheme;
  }
}

class ThemeProvider extends StatefulWidget {
  final Widget child;
  final AppTheme appTheme;
  const ThemeProvider({super.key, required this.child, required this.appTheme});

  @override
  State<ThemeProvider> createState() => ThemeProviderState();

  static ThemeProviderState of(BuildContext context) {
    return context.findAncestorStateOfType<ThemeProviderState>()!;
  }
}

class ThemeProviderState extends State<ThemeProvider> {
  ColorsTheme _colorsTheme = ColorsTheme.light;

  @override
  void initState() {
    super.initState();
    _colorsTheme = ColorsTheme.getThemeFromKey(widget.appTheme);
  }

  void changeTheme(ColorsTheme colorsTheme) => setState(() => _colorsTheme = colorsTheme);

  @override
  Widget build(BuildContext context) {
    return CustomTheme(appTheme: _colorsTheme.theme, child: widget.child);
  }
}
