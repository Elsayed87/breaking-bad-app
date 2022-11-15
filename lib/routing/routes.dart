import '../business%20logic/cubit/cubit/characters_cubit.dart';
import '../constants/string/string_const.dart';
import '../data/models/charcters_model.dart';
import '../data/repository/characters_repo.dart';
import '../data/web_services/characters_webservice.dart';
import '../presentation/screens/characters_details_screen.dart';
import '../presentation/screens/charcters_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouting {
  late CharactersRepo charactersRepo;
  late CharactersCubit charactersCubit;
  AppRouting() {
    charactersRepo = CharactersRepo(CharactersWebService());
    charactersCubit = CharactersCubit(charactersRepo);
  }
  Route? generteRouting(RouteSettings settings) {
    switch (settings.name) {
      case charctersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<CharactersCubit>(
            create: (BuildContext context) => charactersCubit,
            child: CharctersScreen(),
          ),
        );
      case charctersDetailsScreen:
        final character = settings.arguments as CharactersModel;

        return MaterialPageRoute(builder: (context) {
          return BlocProvider<CharactersCubit>(
            create: (context) =>  CharactersCubit(charactersRepo),
            child: CharactersDetailsScreen(
              charactersModel: character,
            ),
          );
        });
    }
  }
}
