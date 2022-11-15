
import '../widgets/build_divider.dart';
import '../widgets/char_info_widget.dart';
import '../widgets/display_random_quote_widget.dart';
import '../widgets/loading_indicator.dart';
import '../../business%20logic/cubit/cubit/characters_cubit.dart';
import '../../constants/my_color/my_color.dart';
import '../../data/models/charcters_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/sliver_app_bar_widget.dart';

class CharactersDetailsScreen extends StatelessWidget {
  const CharactersDetailsScreen({super.key, required this.charactersModel});
  final CharactersModel charactersModel;

  Widget checkIfQuotesLoadedOrNo(CharactersState state) {
    if (state is CharactersQuotesLoaded) {
      return DisplayRandomQuotesOrEmptySpace(
        state: state,
      );
    } else {
      return const LoadingIndicator();
    }
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CharactersCubit>(context)
        .getCharacterQuote(charactersModel.name);
    return Scaffold(
      backgroundColor: MyColor.greyColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBarWidget(
            charId: charactersModel.char_id,
            imageUrl: charactersModel.img,
            nickname: charactersModel.nickname,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CharInfoWidget(
                          title: 'Job : ',
                          value: charactersModel.occupation.join(" / ")),
                      const BuildDivider(endIndent: 320),
                      CharInfoWidget(
                          title: 'Appeared In : ',
                          value: charactersModel.category),
                      const BuildDivider(endIndent: 250),
                      CharInfoWidget(
                          title: 'Seasons  : ',
                          value: charactersModel.appearance.join(" / ")),
                      const BuildDivider(endIndent: 280),
                      CharInfoWidget(
                          title: 'Status  : ', value: charactersModel.status),
                      const BuildDivider(endIndent: 290),
                      charactersModel.better_call_saul_appearance.isEmpty
                          ? Container()
                          : CharInfoWidget(
                              title: 'better call saul Season  : ',
                              value: charactersModel.better_call_saul_appearance
                                  .join(" / ")),
                      charactersModel.better_call_saul_appearance.isEmpty
                          ? Container()
                          : const BuildDivider(endIndent: 160),
                      CharInfoWidget(
                          title: 'Actor/Actress  : ',
                          value: charactersModel.portrayed),
                      const BuildDivider(endIndent: 235),
                      const SizedBox(
                        height: 20,
                      ),
                      BlocBuilder<CharactersCubit, CharactersState>(
                          builder: (BuildContext context, state) {
                        return checkIfQuotesLoadedOrNo(state);
                      }),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 700,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
