import 'package:bloc/bloc.dart';
import '../../../data/models/charcters_model.dart';
import '../../../data/models/quote_model.dart';
import '../../../data/repository/characters_repo.dart';
import 'package:meta/meta.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepo charactersRepo;
  List<CharactersModel> characters = [];
  CharactersCubit(this.charactersRepo) : super(CharactersInitial());
  List<CharactersModel> getAllCharacters() {
    charactersRepo.getAllCharacterService().then((characters) {
      emit(CharactersLoaded(characters));
      this.characters = characters;
    });
    return characters;
  }

  getCharacterQuote(String charName) {
    charactersRepo.getCharactersQuote(charName).then((quotes) {
      emit(CharactersQuotesLoaded(quotes));
    });
  }
}
