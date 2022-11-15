import 'package:dio/dio.dart';

import '../../constants/string/string_const.dart';

class CharactersWebService {
  late Dio dio;
  CharactersWebService() {
    BaseOptions options = BaseOptions(
      baseUrl: BaseUrl,
      connectTimeout: 20 * 1000,
      receiveTimeout: 70 * 1000,
      receiveDataWhenStatusError: true,
      headers: {  "Connection": "Keep-Alive",}
    );
    dio = Dio(options);
  }
  Future<List<dynamic>> getAllCharacterService() async {
    try {
      var response = await dio.get('characters');
    //  print(response.data.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

    Future<List<dynamic>> getCharactersQuote(String charName) async {
    try {
      var response = await dio.get('quote',queryParameters: {'author':charName});
   
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
