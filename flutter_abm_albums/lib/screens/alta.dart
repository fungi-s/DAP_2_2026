import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_abm_albums/providers/album_provider.dart';

class AddAlbumScreen extends ConsumerWidget {
  const AddAlbumScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final tituloController = TextEditingController();
    final artistaController = TextEditingController();
    final descripcionController = TextEditingController();
    final adicionalController = TextEditingController();
    final yearController = TextEditingController();
    final tapaUrlController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text('Agregar álbum', style: GoogleFonts.specialElite())),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: tituloController,
                decoration: const InputDecoration(labelText: 'Título'),
                validator: (value) => (value == null || value.isEmpty) ? 'Campo obligatorio' : null,
              ),
              TextFormField(
                controller: artistaController,
                decoration: const InputDecoration(labelText: 'Artista'),
                validator: (value) => (value == null || value.isEmpty) ? 'Campo obligatorio' : null,
              ),
              TextFormField(
                controller: descripcionController,
                decoration: const InputDecoration(labelText: 'Descripción'),
                validator: (value) => (value == null || value.isEmpty) ? 'Campo obligatorio' : null,
              ),
              TextFormField(
                controller: adicionalController,
                decoration: const InputDecoration(labelText: 'Información adicional'),
                validator: (value) => (value == null || value.isEmpty) ? 'Campo obligatorio' : null,
              ),
              TextFormField(
                controller: yearController,
                decoration: const InputDecoration(labelText: 'Año'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Campo obligatorio';
                  if (int.tryParse(value) == null) return 'Debe ser un número';
                  return null;
                },
              ),
              TextFormField(
                controller: tapaUrlController,
                decoration: const InputDecoration(labelText: 'URL de la tapa'),
                validator: (value) => (value == null || value.isEmpty) ? 'Campo obligatorio' : null,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    final nuevoId = (ref.read(albumListProvider).length + 1).toString();
                    agregarAlbum(
                      ref,
                      Album(
                        id: nuevoId,
                        titulo: tituloController.text,
                        artista: artistaController.text,
                        descripcion: descripcionController.text,
                        adicional: adicionalController.text,
                        year: int.parse(yearController.text),
                        tapaUrl: tapaUrlController.text,
                      ),
                    );
                    context.pop();
                  }
                },
                child: const Text('Confirmar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}