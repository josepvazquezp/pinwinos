import 'dart:convert';

import 'package:equatable/equatable.dart';

class Carta extends Equatable {
  final String? imagen;
  final int? numero;
  final String? color;
  final String? elemento;
  final String? poder;
  final String? poder_imagen;
  final String? id;

  const Carta(
      {this.imagen,
      this.numero,
      this.color,
      this.elemento,
      this.poder,
      this.poder_imagen,
      this.id});

  factory Carta.fromMap(Map<String, dynamic> data) => Carta(
        imagen: data['Imagen'] as String?,
        numero: data['Numero'] as int?,
        color: data['Color'] as String?,
        elemento: data['Elemento'] as String?,
        poder: data['Poder'] as String?,
        poder_imagen: data['Poder'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'Imagen': imagen,
        'Numero': numero,
        'Color': color,
        'Elemento': elemento,
        'Poder': poder,
        'Poder_Imagen': poder_imagen,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Carta].
  factory Carta.fromJson(String data) {
    return Carta.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Carta] to a JSON string.
  String toJson() => json.encode(toMap());

  Carta copyWith({
    String? imagen,
    int? numero,
    String? color,
    String? elemento,
    String? poder,
  }) {
    return Carta(
      imagen: imagen ?? this.imagen,
      numero: numero ?? this.numero,
      color: color ?? this.color,
      elemento: elemento ?? this.elemento,
      poder: poder ?? this.poder,
    );
  }

  @override
  List<Object?> get props => [imagen, numero, color, elemento, poder];
}
