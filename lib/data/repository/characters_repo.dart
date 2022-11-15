import '../models/charcters_model.dart';
import '../models/quote_model.dart';
import '../web_services/characters_webservice.dart';

class CharactersRepo {
  final CharactersWebService charactersWebService;

  CharactersRepo(this.charactersWebService);
  Future<List<CharactersModel>> getAllCharacterService() async {
    final character = await charactersWebService.getAllCharacterService();
    return character.map((e) => CharactersModel.fromJson(e)).toList();
  }

  Future<List<Quote>> getCharactersQuote(String charName) async {
    final quotes = await charactersWebService.getCharactersQuote(charName);
    return quotes.map((e) => Quote.fromJson(e)).toList();
  }
}
