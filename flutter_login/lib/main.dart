import 'package:flutter/material.dart';
//flutter run -d chrome --web-experimental-hot-reload
void main() => runApp(const MyApp()); //basicamente llama a la funcion que es toda mi app. en main.

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Ingresar usuario y contraseña';

    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo), 
        scaffoldBackgroundColor: Colors.indigo[50],
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text(appTitle)),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: const MyCustomForm(),
        ),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() => MyCustomFormState();
}

class MyCustomFormState extends State<MyCustomForm> {
  static const String _usuario = 'fungi';
  static const String _contrasena = '1234abc';

  final _formKey = GlobalKey<FormState>();
  final _usuarioController = TextEditingController();
  final _contrasenaController = TextEditingController();

  @override
  void dispose() { //reset del controller para que no quede el estado anterior en la memoria y haya errores
    _usuarioController.dispose();
    _contrasenaController.dispose();
    super.dispose();
  }

  String? validarUserName(String? text) {//funcion que valida usuario
    if (text == null || text.isEmpty) {//si no pusiste nada pide que lo llenes
      return 'Ingrese el usuario';
    }
    if (text != _usuario) {//si esta mal te avisa
      return 'Nombre de usuario incorrecto';
    }
    return null;//si no devuelve vacio
  }

  String? validarPassword(String? text) {//"" contraseña
    if (text == null || text.isEmpty) {
      return 'Ingrese la contraseña';
    }
    if (text != _contrasena) {
      return 'Contraseña incorrecta';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Nombre de usuario:'),
          TextFormField(
            controller: _usuarioController,
            validator: validarUserName,//llama la validacion. el campo textformfield tiene el parametro de validator y dentro de ese va la validacion que le hagas
          ),
          const SizedBox(height: 12),
          const Text('Contraseña:'),
          TextFormField(//controler "controla" lo que escribo (badum tss)
            controller: _contrasenaController,
            obscureText: true,//este parametro es lo que no deja ver la contraseña. solo hay que setearlo como true
            validator: validarPassword,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ElevatedButton(
              onPressed: () {//al presionar el boton se verifica que los campos sean correctos y se muestra el sncakbar
                final isValid = _formKey.currentState?.validate();
                if (isValid == true) {//si este evento sucede
                  ScaffoldMessenger.of(context).showSnackBar(//activa el mensaje del scaffold, en este caso un snackbar
                    const SnackBar(content: Text('Login correcto')),
                  );
                }
              },
              child: const Text('Logearse'),
            ),
          ),
        ],  
      ), 
    ); 
  }
}