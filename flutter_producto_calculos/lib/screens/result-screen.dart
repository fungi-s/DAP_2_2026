import 'package:flutter/material.dart';

class resultScreen extends StatelessWidget {
  final Map<String, dynamic> data;
  const resultScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Resultados')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Más caro: ${data['nombreCaro']} - ${data['descripcionCaro']}'),
            Text('Más barato: ${data['nombreBarato']} - ${data['descripcionBarato']}'),
            Text('Mayor cantidad: ${data['nombreCantidad']} - ${data['descripcionCantidad']}'),
            Text('Menor cantidad: ${data['nombreMenosCantidad']} - ${data['descripcionMenosCantidad']}'),
            Text('Promedio: ${data['promedio']}'),
          ],
        ),
      ),
    );
  }
}