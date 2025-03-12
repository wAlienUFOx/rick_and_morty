import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/texts.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key, this.height = kToolbarHeight, required this.title});

  final String title;
  final double height;

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorsTheme.of(context).primaryBG,
      toolbarHeight: 80,
      title: Text(title, style: TextsTheme.of(context).heading(ColorsTheme.of(context).primaryText)),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(16))),
    );
  }
}
