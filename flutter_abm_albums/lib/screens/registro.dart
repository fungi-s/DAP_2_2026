import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_abm_albums/providers/user_provider.dart';

class RegistroScreen extends ConsumerStatefulWidget {
  const RegistroScreen({super.key});

  @override
  RegistroScreenState createState() => RegistroScreenState();
}

class RegistroScreenState extends ConsumerState<RegistroScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _mailController = TextEditingController();
  final _passController = TextEditingController();
  final _confirmarPassController = TextEditingController();

  @override
  void dispose() {//reset de los controllers para que no quede estado anterior en memoria
    _nombreController.dispose();
    _mailController.dispose();
    _passController.dispose();
    _confirmarPassController.dispose();
    super.dispose();
  }

  String? validarCampoVacio(String? text, String mensaje) {//misma validación que en login
    if (text == null || text.isEmpty) {
      return mensaje;
    }
    return null;
  }

  String? validarConfirmacion(String? text) {//valida que la confirmación no esté vacía y que coincida con la contraseña
    if (text == null || text.isEmpty) {
      return 'Confirme la contraseña';
    }
    if (text != _passController.text) {
      return 'Las contraseñas no coinciden';
    }
    return null;
  }

    void _intentarRegistro() {
    final isValid = _formKey.currentState?.validate();
    if (isValid != true) return;

    final nombreIngresado = _nombreController.text;
    final mailIngresado = _mailController.text;
    final passwordIngresada = _passController.text;

    final usuarioExistente = ref.read(userByMailProvider(mailIngresado));

    if (usuarioExistente != null) {//chequea que no exista ya un usuario con ese mail
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Ya existe un usuario con ese mail')),
      );
      return;
    }

    final nuevoUsuario = User(
      name: nombreIngresado,
      mail: mailIngresado,
      pass: passwordIngresada,
    );

    ref.read(userListProvider).add(nuevoUsuario);//muta la lista existente en vez de reemplazarla

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Usuario registrado con éxito')),
    );
    context.pop();//vuelve al login
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registrar nuevo usuario')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              Text('Nombre:', style: GoogleFonts.specialElite(color: Colors.white, fontSize: 15,)),
              TextFormField(
                controller: _nombreController,
                style: GoogleFonts.specialElite(color: Colors.white),
                validator: (text) =>
                    validarCampoVacio(text, 'Ingrese el nombre'),
              ),
              const SizedBox(height: 12),
              Text('Mail:', style: GoogleFonts.specialElite(color: Colors.white, fontSize: 15,)),
              TextFormField(
                controller: _mailController,
                style: GoogleFonts.specialElite(color: Colors.white),
                validator: (text) =>
                    validarCampoVacio(text, 'Ingrese el mail'),
              ),
              const SizedBox(height: 12),
              Text('Contraseña:', style: GoogleFonts.specialElite(color: Colors.white, fontSize: 15,)),
              TextFormField(
                controller: _passController,
                obscureText: true,
                style: GoogleFonts.specialElite(color: Colors.white),
                validator: (text) =>
                    validarCampoVacio(text, 'Ingrese la contraseña'),
              ),
              const SizedBox(height: 12),
              Text('Confirmar contraseña:', style: GoogleFonts.specialElite(color: Colors.white, fontSize: 15,)),
              TextFormField(
                controller: _confirmarPassController,
                obscureText: true,
                style: GoogleFonts.specialElite(color: Colors.white),
                validator: validarConfirmacion,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: ElevatedButton(
                  onPressed: _intentarRegistro,
                  child: const Text('Registrarse'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}