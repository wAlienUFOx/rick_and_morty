import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../theme/colors.dart';
import '../theme/texts.dart';

class NavHandler extends StatelessWidget {
  const NavHandler({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Padding(padding: EdgeInsets.only(bottom: MediaQuery.sizeOf(context).height * 0.08), child: navigationShell),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.1,
          child: BottomNavigationBar(
            backgroundColor: ColorsTheme.of(context).secondarySF,
            elevation: 0,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            selectedLabelStyle: TextsTheme.of(context).label(ColorsTheme.of(context).accentText),
            unselectedLabelStyle: TextsTheme.of(context).label(ColorsTheme.of(context).primaryInvertedText),
            selectedItemColor: ColorsTheme.of(context).accentIcon,
            unselectedItemColor: ColorsTheme.of(context).primaryInvertedIcon,
            enableFeedback: true,
            currentIndex: navigationShell.currentIndex,
            onTap: (index) {
              navigationShell.goBranch(index);
            },
            items: [
              buildItem(context: context, index: 0, icon: Icons.home_outlined, label: 'Главная'),
              buildItem(context: context, index: 1, icon: Icons.star_border_outlined, label: 'Избранное'),
              buildItem(context: context, index: 2, icon: Icons.settings, label: 'Настройки'),
            ],
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem buildItem({
    required BuildContext context,
    required int index,
    required IconData icon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: SizedBox.square(
        dimension: 24,
        child: Center(
          child: Icon(
            icon,
            color:
                navigationShell.currentIndex == index
                    ? ColorsTheme.of(context).accentIcon
                    : ColorsTheme.of(context).primaryInvertedIcon,
          ),
        ),
      ),
      label: label,
    );
  }
}
