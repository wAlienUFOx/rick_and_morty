import 'package:flutter/material.dart';

import '../theme/colors.dart';

class BaseCircularProgressIndicator extends StatelessWidget {
  const BaseCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.square(
        dimension: 66,
        child: CircularProgressIndicator(
          color: ColorsTheme.of(context).primarySF,
          backgroundColor: ColorsTheme.of(context).primaryInactiveSF,
          strokeWidth: 10,
        ),
      ),
    );
  }
}
