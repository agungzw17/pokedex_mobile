part of 'models.dart';

class PokemonModel extends Equatable {
  final String? name;
  final List<dynamic>? types;
  final dynamic sprites;

  const PokemonModel({this.name, this.types, this.sprites});

  @override
  List<Object?> get props => [name, types];

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      name: json['name'],
      types: json['types'],
      sprites: json['sprites'],
    );
  }
}
