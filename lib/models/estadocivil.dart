class EstadoCivil {
  final int id;
  final String nombre;

  EstadoCivil({required this.id, required this.nombre});

  factory EstadoCivil.fromJson(Map<String, dynamic> json) {
    return EstadoCivil(
      id:
          json['idestadocivil'] != null
              ? int.tryParse(json['idestadocivil'].toString()) ?? 0
              : 0,
      nombre: json['nombre'] ?? json['estadocivil_nombre'] ?? '',
    );
  }
}
