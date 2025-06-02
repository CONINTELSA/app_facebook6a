import 'package:flutter/material.dart';

class GenericListPage<T> extends StatelessWidget {
  final Future<List<T>> future;
  final String title;
  final Widget Function(T) itemBuilder;

  const GenericListPage({
    super.key,
    required this.future,
    required this.title,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: FutureBuilder<List<T>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay datos'));
          }
          final items = snapshot.data!;
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) => itemBuilder(items[index]),
          );
        },
      ),
    );
  }
}
