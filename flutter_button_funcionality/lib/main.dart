import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//stateful-> resiste los "rebuilds", por eso está en otra clase (si no no se guarda la variable, etc.)
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

//esta otra clase recibe los cambios y es reconstrida con los cambios
class _MyAppState extends State<MyApp> {
  String texto = 'cambios! botones!';
  double tamano = 30;
  var color = Colors.black;
  bool aparece = true;
  void onPressed() {
    
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column( 
            mainAxisAlignment: MainAxisAlignment.center,
            children: [if(aparece)Text(texto, style: TextStyle(color: color, fontSize: tamano),), SizedBox(height: 50,),
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                ElevatedButton(onPressed: () {
                  setState(() {
                    if (color == Colors.red) {
                      color = Colors.black;
                    } else {
                      color = Colors.red;
                    }
                  });
                }, child: Text("rojo")),
                SizedBox(width: 10),
                ElevatedButton(onPressed: (){
                  setState(() {
                    if (color == Colors.blue) {
                      color = Colors.black;
                    } else {
                      color = Colors.blue;
                    }
                  });
                }, child: Text("azul")),
                SizedBox(width: 10),],
              ),Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                ElevatedButton(onPressed: (){
                  setState(() {
                  if(tamano <= 90){
                    tamano += 1;
                  }else{
                    tamano = tamano;
                  }  
                  });
                }, child: Text("agrandar")),
                SizedBox(width: 10),
                ElevatedButton(onPressed: (){
                  setState(() {
                  if(tamano >= 10){
                    tamano -= 1;
                  }else{
                    tamano = tamano;
                  }  
                  });
                }, child: Text("achicar")),
                SizedBox(width: 10),],
              ),Row(
              mainAxisAlignment: MainAxisAlignment.center, children: [
                ElevatedButton(onPressed: (){
                  setState(() {
                  aparece = false; 
                  });
                }, child: Text("desaparecer")),
                SizedBox(width: 10),
                ElevatedButton(onPressed: (){
                  setState(() {
                  aparece = true;
                  });
                }, child: Text("aparecer")),
                SizedBox(width: 10),],
              ),
              SizedBox(height: 20),],
          ),
        ),
      ),
    );
  }
}