// lib/services/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/persona.dart';
import '../models/sexo.dart';
import '../models/direccion.dart';
import '../models/estadocivil.dart';
import '../models/telefono.dart';

class ApiService {
  static const String baseUrl = 'https://educaysoft.org/facebook6a/';

  static Future<List<Persona>> fetchPersonas() async {
    final response = await http.get(
      Uri.parse('${baseUrl}app/controllers/PersonaController.php?action=api'),
    );
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Persona.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar personas');
    }
  }

  static Future<List<Sexo>> fetchSexos() async {
    final response = await http.get(
      Uri.parse('${baseUrl}app/controllers/SexoController.php?action=api'),
    );
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Sexo.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar sexos');
    }
  }

  static Future<List<Direccion>> fetchDirecciones() async {
    final response = await http.get(
      Uri.parse('${baseUrl}app/controllers/DireccionController.php?action=api'),
    );
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Direccion.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar direcciones');
    }
  }

  static Future<List<EstadoCivil>> fetchEstadosCiviles() async {
    final response = await http.get(
      Uri.parse(
        '${baseUrl}app/controllers/EstadocivilController.php?action=api',
      ),
    );
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => EstadoCivil.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar estados civiles');
    }
  }

  static Future<List<Telefono>> fetchTelefonos() async {
    final response = await http.get(
      Uri.parse('${baseUrl}app/controllers/TelefonoController.php?action=api'),
    );
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Telefono.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar teléfonos');
    }
  }
}
