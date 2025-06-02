import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/estadocivil.dart';

class EstadosCivilesPage extends StatelessWidget {
  const EstadosCivilesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 4,
        iconTheme: const IconThemeData(color: Colors.deepPurple),
        title: const Text(
          'Estado civil',
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
      body: FutureBuilder<List<EstadoCivil>>(
        future: ApiService.fetchEstadosCiviles(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay estados civiles'));
          }
          final estados = snapshot.data!;
          return ListView.builder(
            itemCount: estados.length,
            itemBuilder: (context, index) {
              final estado = estados[index];
              return Card(
                color: Colors.pink[50],
                elevation: 3,
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ListTile(
                  leading: const Icon(Icons.favorite, color: Colors.pink),
                  title: Text(
                    estado.nombre,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('ID: ${estado.id}'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
