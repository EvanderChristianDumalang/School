import 'package:dio/dio.dart';
import 'package:pokedex/model/pokemon.dart';

var dio = Dio(BaseOptions(baseUrl: "https://pokeapi.co/api/v2/", connectTimeout: 10000));

class PokeApi {

  Future<List<Pokemon>> getAll() async {
    List<Pokemon> pokemons = [];

    Response response;
    Response responses = await dio.get( "pokemon?offset=0&limit=10");
    //ganti saja ke 151, menggunakan 10 pokemon agar cepat untuk loading

    for (var result in responses.data['results']) {
      response = await dio.get('', options: RequestOptions( baseUrl: result['url']));

      pokemons.add(Pokemon.fromJson(response.data));
    }

    return pokemons;
  }
}

class PokedexViewModel {
  final _api = PokeApi();

  List<Pokemon> pokemons;

  void getAll(Function onLoaded) {
    _api.getAll().then((r) {
      pokemons = r;

      onLoaded();
    }).catchError((e) {
      print(e);
    });
  }
}