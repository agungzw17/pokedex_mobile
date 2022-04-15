import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_mobile/models/models.dart';

import '../services/services.dart';

part 'resource_pokemon_results_state.dart';
part 'resource_pokemon_results_event.dart';

class ResourcePokemonResultsBloc
    extends Bloc<ResourcePokemonResultEvent, ResourcePokemonResultState> {
  ResourcePokemonResultsBloc() : super(ResourcePokemonResultInitial()) {
    List<PokemonModel> listPokemon = [];
    on<FetchResourcePokemonResult>((event, emit) async {
      List<ResourcePokemonResultsModel> listResourcePokemonResult =
          await ResourcePokemonServices.getListPokemon();

      for(ResourcePokemonResultsModel resourcePokemonResultsModel in listResourcePokemonResult) {
        PokemonModel? pokemon = await ResourcePokemonServices.getPokemon(resourcePokemonResultsModel.url);
        listPokemon.add(pokemon!);
      }

      emit(ResourcePokemonResultLoaded(
          listPokemon: listPokemon));
    });
  }
}
