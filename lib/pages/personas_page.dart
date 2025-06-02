import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/persona.dart';

class PersonasPage extends StatefulWidget {
  const PersonasPage({super.key});

  @override
  State<PersonasPage> createState() => _PersonasPageState();
}

class _PersonasPageState extends State<PersonasPage> {
  late Future<List<Persona>> _personasFuture;

  @override
  void initState() {
    super.initState();
    _personasFuture = ApiService.fetchPersonas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 4,
        iconTheme: const IconThemeData(color: Colors.deepPurple),
        title: const Text(
          'Persona',
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
      body: FutureBuilder<List<Persona>>(
        future: _personasFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay personas'));
          }
          final personas = snapshot.data!;
          return ListView.builder(
            itemCount: personas.length,
            itemBuilder: (context, index) {
              final persona = personas[index];
              return MouseRegion(
                onEnter: (_) => setState(() => persona.isHovered = true),
                onExit: (_) => setState(() => persona.isHovered = false),
                child: Card(
                  color: persona.isHovered ? Colors.blue[50] : Colors.white,
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue[200],
                      child: Icon(
                        persona.sexoNombre == 'Masculino'
                            ? Icons.male
                            : Icons.female,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      '${persona.nombres} ${persona.apellidos}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(
                              Icons.cake,
                              size: 16,
                              color: Colors.pinkAccent,
                            ),
                            const SizedBox(width: 4),
                            Text(persona.fechanacimiento),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.wc, size: 16, color: Colors.teal),
                            const SizedBox(width: 4),
                            Text(persona.sexoNombre),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.favorite,
                              size: 16,
                              color: Colors.redAccent,
                            ),
                            const SizedBox(width: 4),
                            Text(persona.estadoCivilNombre),
                          ],
                        ),
                      ],
                    ),
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
