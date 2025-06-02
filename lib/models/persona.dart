// lib/models/persona.dart
class Persona {
  final int id;
  final String nombres;
  final String apellidos;
  final String fechanacimiento;
  final int idsexo;
  final int idestadocivil;
  final String sexoNombre;
  final String estadoCivilNombre;
  bool isHovered = false; // Para hover en web

  Persona({
    required this.id,
    required this.nombres,
    required this.apellidos,
    required this.fechanacimiento,
    required this.idsexo,
    required this.idestadocivil,
    required this.sexoNombre,
    required this.estadoCivilNombre,
  });

  factory Persona.fromJson(Map<String, dynamic> json) {
    return Persona(
      id:
          json['idpersona'] != null
              ? int.tryParse(json['idpersona'].toString()) ?? 0
              : 0,
      nombres: json['nombres'] ?? '',
      apellidos: json['apellidos'] ?? '',
      fechanacimiento: json['fechanacimiento'] ?? '',
      idsexo:
          json['idsexo'] != null
              ? int.tryParse(json['idsexo'].toString()) ?? 0
              : 0,
      idestadocivil:
          json['idestadocivil'] != null
              ? int.tryParse(json['idestadocivil'].toString()) ?? 0
              : 0,
      sexoNombre: json['sexo_nombre'] ?? '',
      estadoCivilNombre: json['estadocivil_nombre'] ?? '',
    );
  }
}
