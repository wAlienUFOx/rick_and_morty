import 'package:flutter/material.dart';
import 'package:rick_and_morty/presentation/theme/colors.dart';
import 'package:rick_and_morty/presentation/theme/texts.dart';

SnackBar snackBar(BuildContext context, String title) {
  return SnackBar(
    content: Text(
      title,
      style: TextsTheme.of(context).body(ColorsTheme.of(context).primaryInvertedText),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    ),
    backgroundColor: ColorsTheme.of(context).primarySF,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    behavior: SnackBarBehavior.floating,
  );
}
