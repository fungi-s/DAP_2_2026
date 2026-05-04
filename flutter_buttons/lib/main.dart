import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void onPressed() {
    // Aquí puedes agregar la lógica que quieras cuando se presione el botón
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: onPressed, child: Text("uno")),
                  SizedBox(width: 10), 
                  ElevatedButton(onPressed: onPressed, child: Text("dos")),
                  SizedBox(width: 10),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: onPressed, child: Text("uno")),
                  SizedBox(width: 10), 
                  ElevatedButton(onPressed: onPressed, child: Text("dos")),
                  SizedBox(width: 10),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: onPressed, child: Text("uno")),
                  SizedBox(width: 10), 
                  ElevatedButton(onPressed: onPressed, child: Text("dos")),
                  SizedBox(width: 10),
                ],
              ),
              SizedBox(height: 20), 
            ],
          ),
        ),
      ),
    );
  }
}