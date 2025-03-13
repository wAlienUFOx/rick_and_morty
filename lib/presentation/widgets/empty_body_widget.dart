import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/texts.dart';

class EmptyBodyWidget extends StatelessWidget {
  const EmptyBodyWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.star_border_outlined, color: ColorsTheme.of(context).accentIcon, size: 72),
          const SizedBox(height: 16),
          Text(
            'Тут пока что пусто',
            style: TextsTheme.of(context).heading(ColorsTheme.of(context).primaryText),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextsTheme.of(context).body(ColorsTheme.of(context).secondaryText),
          ),
        ],
      ),
    );
  }
}