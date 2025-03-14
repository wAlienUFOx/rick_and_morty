import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/presentation/screens/favorite/favorite_bloc/favorite_bloc.dart';
import 'package:rick_and_morty/presentation/screens/favorite/favorite_bloc/favorite_event.dart';
import 'package:rick_and_morty/presentation/screens/favorite/favorite_bloc/favorite_state.dart';
import 'package:rick_and_morty/presentation/widgets/favorite/favorite_tile_widget.dart';

import '../../../data/models/character_model.dart';
import '../../theme/colors.dart';
import '../../widgets/base_circular_progress_indicator.dart';
import '../../widgets/empty_body_widget.dart';
import '../../widgets/main_app_bar.dart';
import '../../widgets/error_body_widget.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsTheme.of(context).secondaryBG,
      appBar: const MainAppBar(title: 'Избранное'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocBuilder<FavoriteBloc, FavoriteState>(
          builder: (context, state) {
            if (state is LoadingFavoriteState) return const BaseCircularProgressIndicator();
            if (state is ErrorFavoriteState) {
              return ErrorBodyWidget(
                onRefresh: () => BlocProvider.of<FavoriteBloc>(context).add(LoadFavoriteEvent()),
                error: 'Что-то пошло не так. Обновите страницу',
              );
            }
            if (state is EmptyFavoriteState) {
              return EmptyBodyWidget(title: 'Добавьте персонажа в избранное и он появится здесь');
            }
            return _buildBody(state.favorite);
          },
        ),
      ),
    );
  }

  Widget _buildBody(List<Character> characters) {
    return ListView(children: characters.map((e) => FavoriteTileWidget(key: ValueKey(e.id), character: e)).toList());
  }
}
