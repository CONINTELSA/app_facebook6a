class Direccion {
  final int id;
  final String nombre; // <-- Cambiado a 'nombre'
  final int idpersona;

  Direccion({required this.id, required this.nombre, required this.idpersona});

  factory Direccion.fromJson(Map<String, dynamic> json) {
    return Direccion(
      id:
          json['iddireccion'] != null
              ? int.tryParse(json['iddireccion'].toString()) ?? 0
              : 0,
      nombre: json['nombre'] ?? '', // <-- Aquí también
      idpersona:
          json['idpersona'] != null
              ? int.tryParse(json['idpersona'].toString()) ?? 0
              : 0,
    );
  }
}
