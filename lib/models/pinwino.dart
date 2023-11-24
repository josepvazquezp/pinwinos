import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:pinwinos/models/carta.dart';

class Pinwino extends Equatable {
  final String? id;
  final String? nombre;
  final String? correo;
  final String? password;
  final int? victorias;
  final int? derrotas;
  final String? fecha;
  final bool? conectado;
  List<Carta>? deck;
  List<Carta>? library;
  String? gorro;
  final List<String> gorros;
  final List<String> friends;

  Pinwino({
    this.id,
    this.nombre,
    this.correo,
    this.password,
    this.victorias,
    this.derrotas,
    this.fecha,
    this.conectado,
    this.deck,
    this.library,
    this.gorro,
    required this.gorros,
    required this.friends,
  });

  factory Pinwino.fromMap(Map<String, dynamic> data) => Pinwino(
      id: data['Id'] as String?,
      nombre: data['Nombre'] as String?,
      correo: data['Correo'] as String?,
      password: data['Password'] as String?,
      victorias: data['Victorias'] as int?,
      derrotas: data['Derrotas'] as int?,
      fecha: data['Fecha'] as String?,
      conectado: data['Conectado'] as bool?,
      deck: data['Deck'] as List<Carta>?,
      library: data['Library'] as List<Carta>?,
      gorro: data['Gorro'] as String?,
      gorros: data['Gorros'] as List<String>,
      friends: data['Friends'] as List<String>);

  Map<String, dynamic> toMap() => {
        'Id': id,
        'Nombre': nombre,
        'Correo': correo,
        'Password': password,
        'Victorias': victorias,
        'Derrotas': derrotas,
        'Fecha': fecha,
        'Conectado': conectado,
        'Deck': deck,
        'Library': library,
        'Gorro': gorro,
        'Gorros': gorros,
        'Friends': friends,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Pinwino].
  factory Pinwino.fromJson(String data) {
    return Pinwino.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Pinwino] to a JSON string.
  String toJson() => json.encode(toMap());

  Pinwino copyWith({
    String? id,
    String? nombre,
    String? correo,
    String? password,
    int? victorias,
    int? derrotas,
    String? fecha,
    bool? conectado,
    List<Carta>? deck,
    List<Carta>? library,
    String? gorro,
    List<String>? gorros,
    List<String>? friends,
  }) {
    return Pinwino(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      correo: correo ?? this.correo,
      password: password ?? this.password,
      victorias: victorias ?? this.victorias,
      derrotas: derrotas ?? this.derrotas,
      fecha: fecha ?? this.fecha,
      conectado: conectado ?? this.conectado,
      deck: deck ?? this.deck,
      library: library ?? this.library,
      gorro: gorro ?? this.gorro,
      gorros: gorros ?? this.gorros,
      friends: friends ?? this.friends,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      nombre,
      correo,
      password,
      victorias,
      derrotas,
      fecha,
      conectado,
      deck,
      library,
      gorro,
      gorros,
      friends,
    ];
  }
}
