import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/texts.dart';

class NetErrorBodyWidget extends StatelessWidget {
  const NetErrorBodyWidget({super.key, required this.onRefresh, required this.error, this.smallButton = false});

  final void Function() onRefresh;
  final bool smallButton;
  final String error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.error_outline, color: ColorsTheme.of(context).accentIcon, size: 72),
          const SizedBox(height: 16),
          Text(
            error.contains('Нет сети') ? 'Нет сети' : 'Ошибка',
            style: TextsTheme.of(context).heading(ColorsTheme.of(context).primaryText),
          ),
          const SizedBox(height: 4),
          Text(
            error.contains('Нет сети') ? 'Проверьте соединение с сетью и обновите страницу' : error,
            textAlign: TextAlign.center,
            style: TextsTheme.of(context).body(ColorsTheme.of(context).secondaryText),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: onRefresh,
              style: TextButton.styleFrom(
                backgroundColor: ColorsTheme.of(context).primarySF,
                overlayColor: ColorsTheme.of(context).primaryPressedSF,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: Text('Обновить', style: TextsTheme.of(context).body(ColorsTheme.of(context).primaryInvertedText)),
            ),
          ),
        ],
      ),
    );
  }
}
