part of 'resource_pokemon_results_bloc.dart';

abstract class ResourcePokemonResultState extends Equatable {
  const ResourcePokemonResultState();
}

class ResourcePokemonResultInitial extends ResourcePokemonResultState {
  @override
  List<Object?> get props => [];
}

class ResourcePokemonResultLoaded extends ResourcePokemonResultState {
  final List<PokemonModel>? listPokemon;

  const ResourcePokemonResultLoaded({this.listPokemon});

  @override
  List<Object?> get props => [listPokemon];
}
