part of 'models.dart';

class ResourcePokemonResultsModel extends Equatable {
  final String? name;
  final String? url;

  const ResourcePokemonResultsModel({this.name, this.url});

  @override
  List<Object?> get props => [name, url];

  factory ResourcePokemonResultsModel.fromJson(Map<String, dynamic> json) {
    return ResourcePokemonResultsModel(
        name: json['name'],
        url: json['url']);
  }
}