import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/data/models/character_model.dart';
import 'package:rick_and_morty/presentation/screens/favorite/favorite_bloc/favorite_bloc.dart';
import 'package:rick_and_morty/presentation/screens/favorite/favorite_bloc/favorite_event.dart';
import 'package:rick_and_morty/presentation/widgets/character/character_tile_widget.dart';

import '../../theme/colors.dart';

class FavoriteTileWidget extends StatefulWidget {
  const FavoriteTileWidget({super.key, required this.character});

  final Character character;

  @override
  State<FavoriteTileWidget> createState() => _FavoriteTileWidgetState();
}

class _FavoriteTileWidgetState extends State<FavoriteTileWidget> {
  bool toDelete = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        if (details.delta.dx < 0) setState(() => toDelete = true);
        if (details.delta.dx > 0) setState(() => toDelete = false);
      },
      child: Row(
        children: [
          Expanded(
            child: CharacterTileWidget(
              character: widget.character,
              hasFavoriteButton: false,
              onSlide: () => setState(() => toDelete = !toDelete),
            ),
          ),
          GestureDetector(
            onTap: () => BlocProvider.of<FavoriteBloc>(context).add(AddRemoveFavoriteEvent(widget.character)),
            child: AnimatedContainer(
              width: toDelete ? 72 : 0,
              height: 86,
              decoration: BoxDecoration(
                color: ColorsTheme.of(context).negative,
                borderRadius: const BorderRadius.horizontal(right: Radius.circular(8)),
              ),
              duration: const Duration(milliseconds: 100),
              child: Center(
                child: Icon(Icons.delete_outline, size: 24, color: ColorsTheme.of(context).primaryInvertedIcon),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
