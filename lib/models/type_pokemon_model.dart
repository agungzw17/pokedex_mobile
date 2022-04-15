part of 'models.dart';

class TypePokemonModel extends Equatable{
  final String? name;
  final Map<String, dynamic>? url;

  const TypePokemonModel({this.name, this.url});

  @override
  List<Object?> get props => [name, url];

  factory TypePokemonModel.fromJson(Map<String, dynamic> json) {
    return TypePokemonModel(
        name: json['name'],
        url: json['url']);
  }
}