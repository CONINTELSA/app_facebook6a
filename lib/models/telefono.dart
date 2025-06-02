class Telefono {
  final int id;
  final String numero;
  final int idpersona;

  Telefono({required this.id, required this.numero, required this.idpersona});

  factory Telefono.fromJson(Map<String, dynamic> json) {
    return Telefono(
      id:
          json['idtelefono'] != null
              ? int.tryParse(json['idtelefono'].toString()) ?? 0
              : 0,
      numero: json['numero'] ?? '',
      idpersona:
          json['idpersona'] != null
              ? int.tryParse(json['idpersona'].toString()) ?? 0
              : 0,
    );
  }
}
