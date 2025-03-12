import 'package:flutter/material.dart';
import 'package:rick_and_morty/presentation/theme/colors.dart';

class CharacterTileLoadingWidget extends StatelessWidget {
  const CharacterTileLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: ColorsTheme.of(context).primaryBG, borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _placeHolder(context, width: 70, height: 70),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _placeHolder(context, width: 80, height: 20),
              const SizedBox(height: 4),
              _placeHolder(context, width: 30, height: 12),
              const SizedBox(height: 4),
              _placeHolder(context, width: 30, height: 12),
            ],
          ),
          Spacer(),
          //favorite ? :
          Icon(Icons.star_border_outlined, color: ColorsTheme.of(context).accentIcon, size: 30),
        ],
      ),
    );
  }

  Widget _placeHolder(BuildContext context, {required double width, required double height}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: ColorsTheme.of(context).secondaryBG,
      ),
      height: height,
      width: width,
    );
  }
}
