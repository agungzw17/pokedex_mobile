part of 'resource_pokemon_results_bloc.dart';

abstract class ResourcePokemonResultEvent extends Equatable {
  const ResourcePokemonResultEvent();
}

class FetchResourcePokemonResult extends ResourcePokemonResultEvent {
  @override
  List<Object?> get props => [];
}
