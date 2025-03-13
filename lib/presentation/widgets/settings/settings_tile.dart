import 'package:flutter/material.dart';

import '../../theme/colors.dart';
import '../../theme/texts.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({super.key, required this.title, required this.active, required this.onSwitch});

  final String title;
  final bool active;
  final void Function(bool) onSwitch;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: ColorsTheme.of(context).primaryBG, borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              title,
              style: TextsTheme.of(context).heading2(ColorsTheme.of(context).primaryText),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 12),
          Switch(
            value: active,
            onChanged: onSwitch,
            activeColor: ColorsTheme.of(context).primaryInvertedIcon,
            activeTrackColor: ColorsTheme.of(context).accentIcon,
            inactiveThumbColor: ColorsTheme.of(context).primaryIcon,
          ),
        ],
      ),
    );
  }
}
