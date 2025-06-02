import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/direccion.dart';

class DireccionesPage extends StatelessWidget {
  const DireccionesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 4,
        iconTheme: const IconThemeData(color: Colors.deepPurple),
        title: const Text(
          'Dirección',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            letterSpacing: 2,
            color: Colors.deepPurple,
            shadows: [
              Shadow(
                blurRadius: 4,
                color: Colors.black26,
                offset: Offset(2, 2),
              ),
            ],
          ),
        ),
      ),
      body: FutureBuilder<List<Direccion>>(
        future: ApiService.fetchDirecciones(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay direcciones'));
          }
          final direcciones = snapshot.data!;
          return ListView.builder(
            itemCount: direcciones.length,
            itemBuilder: (context, index) {
              final direccion = direcciones[index];
              return Card(
                color: Colors.green[50],
                elevation: 3,
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ListTile(
                  leading: const Icon(Icons.home, color: Colors.green),
                  title: Text(
                    direccion
                        .nombre, // <-- Aquí se muestra el nombre de la dirección
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'ID: ${direccion.id} - Persona: ${direccion.idpersona}',
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
