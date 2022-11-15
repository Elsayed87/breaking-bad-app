import '../../business%20logic/cubit/cubit/characters_cubit.dart';
import '../../constants/my_color/my_color.dart';
import '../../data/models/charcters_model.dart';
import '../widgets/app_bar_title.dart';
import '../widgets/character_item.dart';
import '../widgets/loading_indicator.dart';
import '../widgets/no_internet_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';

import '../widgets/textformfield_widget.dart';

class CharctersScreen extends StatefulWidget {
  const CharctersScreen({super.key});

  @override
  State<CharctersScreen> createState() => _CharctersScreenState();
}

class _CharctersScreenState extends State<CharctersScreen> {
  late List<CharactersModel> allCharacters;
  late List<CharactersModel> searchedCharactersList;
  final serachedController = TextEditingController();
  bool _isSearching = false;
  @override
  void initState() {
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();

    super.initState();
  }

  void addSearchedItemToSearchedCharacters(String searchedCharacters) {
    searchedCharactersList = allCharacters
        .where((element) =>
            element.name.toLowerCase().startsWith(searchedCharacters))
        .toList();
    setState(() {});
  }

  List<Widget> _buildAppBarAction() {
    if (_isSearching) {
      return [
        IconButton(
            onPressed: () {
              _clearSearch();
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.clear,
              color: MyColor.greyColor,
            ))
      ];
    } else {
      return [
        IconButton(
            onPressed: () {
              _startSearch();
            },
            icon: Icon(
              Icons.search,
              color: MyColor.greyColor,
            ))
      ];
    }
  }

  void _startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearch();
    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearch() {
    setState(() {
      serachedController.clear();
    });
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
        builder: (BuildContext context, state) {
      if (state is CharactersLoaded) {
        allCharacters = state.characters;
        return buildLoadedListWidgets();
      } else {
        return const LoadingIndicator();
      }
    });
  }

  Widget buildLoadedListWidgets() {
    return SingleChildScrollView(
      child: Container(
        color: MyColor.greyColor,
        child: Column(children: [
          buildCharactersList(),
        ]),
      ),
    );
  }

  Widget buildCharactersList() {
    return GridView.builder(
        itemCount: serachedController.text.isEmpty
            ? allCharacters.length
            : searchedCharactersList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (BuildContext context, i) {
          return CharacterItem(
            charactersModel: serachedController.text.isEmpty
                ? allCharacters[i]
                : searchedCharactersList[i],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: _isSearching
            ? BackButton(
                color: MyColor.greyColor,
              )
            : Container(),
        backgroundColor: MyColor.yellowColor,
        title: _isSearching
            ? BuildTextField(
                onChanged: (searchedCharacters) {
                  addSearchedItemToSearchedCharacters(searchedCharacters);
                },
                serachedController: serachedController,
              )
            : const AppBarTitle(),
        actions: _buildAppBarAction(),
      ),
      body: OfflineBuilder(
          child: const LoadingIndicator(),
          connectivityBuilder: (
            BuildContext context,
            ConnectivityResult connectivity,
            Widget child,
          ) {
            final bool connected = connectivity != ConnectivityResult.none;
            if (connected) {
              return buildBlocWidget();
            } else {
              return const NoInternetWidget();
            }
          }),
    );
  }
}
