part of 'models.dart';

class TypesPokemonModel extends Equatable{
  final String? slot;
  final Map<String, dynamic>? type;

  const TypesPokemonModel({this.slot, this.type});

  @override
  List<Object?> get props => [slot, type];

  factory TypesPokemonModel.fromJson(Map<String, dynamic> json) {
    return TypesPokemonModel(
        slot: json['slot'].toString(),
        type: json['type']);
  }
}