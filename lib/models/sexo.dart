// lib/models/sexo.dart
class Sexo {
  final int id;
  final String nombre;

  Sexo({required this.id, required this.nombre});

  factory Sexo.fromJson(Map<String, dynamic> json) {
    return Sexo(
      id:
          json['idsexo'] != null
              ? int.tryParse(json['idsexo'].toString()) ?? 0
              : 0,
      nombre: json['nombre'] ?? json['sexo_nombre'] ?? '',
    );
  }
}
