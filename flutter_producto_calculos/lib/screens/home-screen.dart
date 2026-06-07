import 'package:flutter/material.dart';
import 'package:flutter_producto_calculos/entities.dart';
import 'package:go_router/go_router.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProductForm();
  }
}

class ProductForm extends StatefulWidget {
  const ProductForm({super.key});
  @override
  ProductFormState createState() => ProductFormState();
}

class ProductFormState extends State<ProductForm> {

  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _descripcionController = TextEditingController();
  final _precioController = TextEditingController();
  final _cantidadController = TextEditingController();

  int totalProductos = 0;
  double masCaro = 0;
  String nombreCaro = '';
  String descripcionCaro = '';
  double masBarato = double.infinity;
  String nombreBarato = '';
  String descripcionBarato = '';
  double masCantidad = 0;
  String nombreCantidad = '';
  String descripcionCantidad = '';
  double menosCantidad = double.infinity;
  String nombreMenosCantidad = '';
  String descripcionMenosCantidad = '';
  double promedio = 0;

  @override
  void dispose() {
    _nombreController.dispose();
    _descripcionController.dispose();
    _precioController.dispose();
    _cantidadController.dispose();
    super.dispose();
  }

  String? validarNombre(String? text) {
    if (text == null || text.isEmpty) {
      return 'Ingrese el nombre del producto';
    }
    return null;
  }

  String? validarDescripcion(String? text) {
    if (text == null || text.isEmpty) {
      return 'Ingrese la descripción del producto';
    }
    return null;
  }

  String? validarPrecio(String? text) {
    if (text == null || text.isEmpty || double.tryParse(text) == null) {
      return 'Ingrese un precio valido';
    }
    return null;
  }

  String? validarCantidad(String? text) {
    if (text == null || text.isEmpty || int.tryParse(text) == null) {
      return 'Ingrese una cantidad valida';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ingresar producto')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              const Text('Nombre del producto:'),
              TextFormField(
                controller: _nombreController,
                validator: validarNombre,
              ),
              const SizedBox(height: 12),
              const Text('Descripción:'),
              TextFormField(
                controller: _descripcionController,
                validator: validarDescripcion,
              ),
              const SizedBox(height: 12),
              const Text('Precio:'),
              TextFormField(
                controller: _precioController,
                validator: validarPrecio,
              ),
              const SizedBox(height: 12),
              const Text('Cantidad:'),
              TextFormField(
                controller: _cantidadController,
                validator: validarCantidad,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: ElevatedButton(
                  onPressed: () {
                    final isValid = _formKey.currentState?.validate();
                    if (isValid == true) {
                      final precio = double.parse(_precioController.text);//convierte precio y cantidad a numeros
                      final cantidad = double.parse(_cantidadController.text);
                      Producto producto = Producto(
                        nombre: _nombreController.text,
                        descripcion: _descripcionController.text,
                        precio: _precioController.text,
                        cantidad: _cantidadController.text,
                      );
                      _nombreController.clear();//borra el texto del form cuando se apreta ingresar
                      _descripcionController.clear();
                      _precioController.clear();
                      _cantidadController.clear();
                      setState(() {//actualiza la pantalla para mostrar los nuevos calculos 
                      totalProductos++;
                      //calculos
                      if (precio > masCaro) {
                        masCaro = precio;
                        nombreCaro = producto.nombre;
                        descripcionCaro = producto.descripcion;
                      }
                      if (precio < masBarato) {
                        masBarato = precio;
                        nombreBarato = producto.nombre;
                        descripcionBarato = producto.descripcion;
                      }
                      if (cantidad < menosCantidad) {
                        menosCantidad = cantidad;
                        nombreMenosCantidad = producto.nombre;
                        descripcionMenosCantidad = producto.descripcion;
                      }
                      if (cantidad > masCantidad) {
                        masCantidad = cantidad;
                        nombreCantidad = producto.nombre;
                        descripcionCantidad = producto.descripcion;
                      }
                      promedio = (promedio * (totalProductos - 1) + precio) / totalProductos;//el -1 del total productos pq el ultimo contador no va para el calculo
                      });
                    }
                  },
                  child: const Text('Ingresar'),
                ),
              ),
              Padding(//boton de calcular
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: ElevatedButton(
                  onPressed: () {
                    if(totalProductos == 0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Ingrese productos para calcular')),
                      );
                      return;
                    }else{
                      context.go('/results', extra: {//este es la data extra que aparece en el goroute
                      'nombreCaro': nombreCaro,
                      'descripcionCaro': descripcionCaro,
                      'nombreBarato': nombreBarato,
                      'descripcionBarato': descripcionBarato,
                      'nombreCantidad': nombreCantidad,
                      'descripcionCantidad': descripcionCantidad,
                      'nombreMenosCantidad': nombreMenosCantidad,
                      'descripcionMenosCantidad': descripcionMenosCantidad,
                      'promedio': promedio,
                      });
                    }   
                  },
                  child: const Text('Calcular'),
                ),
              ),
              //Text('precio mas caro: $nombreCaro - $masCaro'),
              //Text('precio mas barato: $nombreBarato - $masBarato'),
              //Text('cantidad mas alta: $nombreCantidad - $masCantidad'),
              //Text('cantidad mas baja: $nombreMenosCantidad - $menosCantidad'),
              //Text('promedio de precios: $promedio'),
            ],  
          ), 
        ),
      ),
    ); 
  }
}