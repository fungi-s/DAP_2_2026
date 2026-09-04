import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_abm_albums/providers/user_provider.dart';
//flutter run -d chrome --web-experimental-hot-reload

class MyCustomForm extends ConsumerStatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() => MyCustomFormState();
}

class MyCustomFormState extends ConsumerState<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  final _mailController = TextEditingController();
  final _contrasenaController = TextEditingController();

  @override
  void dispose() {//reset del controller para que no quede el estado anterior en la memoria y haya errores
    _mailController.dispose();
    _contrasenaController.dispose();
    super.dispose();
  }

  String? validarCampoVacio(String? text, String mensaje) {//valida antes de todo que los campos estén completos
    if (text == null || text.isEmpty) {
      return mensaje;
    }
    return null;
  }

  void _intentarLogin() {
    final isValid = _formKey.currentState?.validate();
    if (isValid != true) return;

    final mailIngresado = _mailController.text;
    final passwordIngresada = _contrasenaController.text;

    final usuarioEncontrado = ref.read(userByMailProvider(mailIngresado));

    if (usuarioEncontrado == null) {//primero busca el usuario y si no esta muestra snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Usuario no encontrado')),
      );
      return;
    }

    if (usuarioEncontrado.pass != passwordIngresada) {//despues de esa validacion pasa a la validación de la pass, lo mismo, si no va por snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Contraseña incorrecta')),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(//por ultimo si esta todo bien tambien manda por snackbar y pasa a la otra pantalla
      const SnackBar(content: Text('Ingresando...')),
    );
    context.go('/home');//si mustra el ingresando, o sea si se logea tmb pasa a la proxima pantalla
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: const Text('Ingresar mail y contraseña')),
      body: Padding(
      padding: const EdgeInsets.all(16),
        child: Form(
        key: _formKey,
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             const SizedBox(height: 12),
             Text('Mail:', style: GoogleFonts.specialElite(color: Colors.white, fontSize: 15,)),//campo 1 mail
             TextFormField(
               controller: _mailController,
               style: GoogleFonts.specialElite(color: Colors.white),
               validator: (text) =>
                validarCampoVacio(text, 'Ingrese el mail'),//si esta vacio pide que lo completes lo mismo para el otro campo
              ),
              const SizedBox(height: 12),
              Text('Contraseña:', style: GoogleFonts.specialElite(color: Colors.white, fontSize: 15,)),//campo 2 contraseña
              TextFormField(
                controller: _contrasenaController,
                obscureText: true,
                style: GoogleFonts.specialElite(color: Colors.white),
                validator: (text) =>
                validarCampoVacio(text, 'Ingrese la contraseña'),
              ),
              Padding(//boton
              padding: const EdgeInsets.symmetric(vertical: 16),
                child: ElevatedButton(
                onPressed: _intentarLogin,
                child: const Text('Logearse'),
                ),
              ),
              TextButton(//boton para ir a la pantalla de registro
                onPressed: () => context.push('/registro'),
                child: Text('Registrate', style: GoogleFonts.specialElite(color: Colors.white, fontSize: 13,)),
              ),
            ],
          ),
        ),
    ),
    );
  }
}