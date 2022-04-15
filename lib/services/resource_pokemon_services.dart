part of 'services.dart';

class ResourcePokemonServices {
  static Future<List<ResourcePokemonResultsModel>>
      getListPokemon() async {
    var response =
        await http.get(Uri.parse('${apiKey}pokemon/?limit=5&offset=0'));

    if (response.statusCode == 200) {
      var jsonObject = json.decode(response.body);
      var data = (jsonObject as Map<String, dynamic>)['results'] as List;
      // if (kDebugMode) {
      //   print(data.map((item) => item["url"]));
      // }
      return data
          .map<ResourcePokemonResultsModel>(
              (item) => ResourcePokemonResultsModel.fromJson(item))
          .toList();
    } else {
      return [];
    }
  }

  static Future<PokemonModel?> getPokemon(String? url) async {
    var response =
    await http.get(Uri.parse(url ?? ""));

    if (response.statusCode == 200) {
      var jsonObject = json.decode(response.body);

      return PokemonModel.fromJson(jsonObject);
    } else {
      return null;
    }
  }
}
