// lib/pages/sexos_page.dart
import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/sexo.dart';

class SexosPage extends StatelessWidget {
  const SexosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 4,
        iconTheme: const IconThemeData(color: Colors.deepPurple),
        title: const Text(
          'Sexo',
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
      body: FutureBuilder<List<Sexo>>(
        future: ApiService.fetchSexos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay sexos'));
          }
          final sexos = snapshot.data!;
          return ListView.builder(
            itemCount: sexos.length,
            itemBuilder: (context, index) {
              final sexo = sexos[index];
              return Card(
                color: Colors.teal[50],
                elevation: 3,
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ListTile(
                  leading: const Icon(Icons.wc, color: Colors.teal),
                  title: Text(
                    sexo.nombre,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('ID: ${sexo.id}'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
