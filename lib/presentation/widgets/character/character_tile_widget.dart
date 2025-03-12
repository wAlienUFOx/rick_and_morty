import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:rick_and_morty/presentation/theme/texts.dart';

import '../../../data/models/character_model.dart';
import '../../theme/colors.dart';

class CharacterTileWidget extends StatelessWidget {
  const CharacterTileWidget({super.key, required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: ColorsTheme.of(context).primaryBG, borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              height: 70,
              width: 70,
              child: CachedNetworkImage(
                imageUrl: character.image,
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  character.name,
                  style: TextsTheme.of(context).body(ColorsTheme.of(context).primaryText),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(character.gender, style: TextsTheme.of(context).label(ColorsTheme.of(context).primaryText)),
                const SizedBox(height: 4),
                Text(
                  character.status,
                  style: TextsTheme.of(context).label(
                    character.status == 'Alive'
                        ? ColorsTheme.of(context).positiveText
                        : character.status == 'Dead'
                        ? ColorsTheme.of(context).negativeText
                        : ColorsTheme.of(context).primaryText,
                  ),
                ),
              ],
            ),
          ),
          //favorite ? :
          Icon(Icons.star_border_outlined, color: ColorsTheme.of(context).accentIcon, size: 30),
        ],
      ),
    );
  }
}
