import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/presentation/screens/favorite/favorite_bloc/favorite_bloc.dart';
import 'package:rick_and_morty/presentation/screens/favorite/favorite_bloc/favorite_state.dart';
import 'package:rick_and_morty/presentation/screens/home/character_bloc/character_bloc.dart';
import 'package:rick_and_morty/presentation/screens/home/character_bloc/character_event.dart';
import 'package:rick_and_morty/presentation/screens/home/character_bloc/character_state.dart';
import 'package:rick_and_morty/presentation/theme/colors.dart';
import 'package:rick_and_morty/presentation/widgets/character/character_tile_loading_widget.dart';
import 'package:rick_and_morty/presentation/widgets/character/character_tile_widget.dart';
import 'package:rick_and_morty/presentation/widgets/main_snack_bar.dart';
import 'package:rick_and_morty/presentation/widgets/error_body_widget.dart';

import '../../../data/models/character_model.dart';
import '../../widgets/base_circular_progress_indicator.dart';
import '../../widgets/main_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.offset == scrollController.position.maxScrollExtent) {
        BlocProvider.of<CharacterBloc>(context).add(LoadMoreCharacterEvent());
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsTheme.of(context).secondaryBG,
      appBar: const MainAppBar(title: 'Персонажи'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocConsumer<CharacterBloc, CharacterState>(
          listener: (context, state) {
            if (state is ErrorMoreCharacterState) {
              ScaffoldMessenger.of(context).showSnackBar(snackBar(context, state.message));
            }
          },
          builder: (context, state) {
            if (state is LoadingCharacterState) return const BaseCircularProgressIndicator();
            if (state is ErrorCharacterState) {
              return ErrorBodyWidget(
                onRefresh: () => BlocProvider.of<CharacterBloc>(context).add(LoadCharacterEvent()),
                error: state.message,
              );
            }
            return _buildBody(state.characters);
          },
        ),
      ),
    );
  }

  Widget _buildBody(List<Character> characters) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (context, state) {
        return ListView(
          controller: scrollController,
          children: [
            ...characters.map((e) => CharacterTileWidget(character: e)),
            if (BlocProvider.of<CharacterBloc>(context).state is LoadingMoreCharacterState)
              CharacterTileLoadingWidget(),
          ],
        );
      },
    );
  }
}
