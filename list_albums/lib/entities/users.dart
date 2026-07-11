class User {

   String name;
   String password;


    User({
      required this.name,
      required this.password,
    });
}

final users = [
  User(name: 'fungi', password: '1234abc'),
  User(name: 'ammanita', password: 'abc1234'),
  User(name: 'grace', password: 'rocky123'),
];

//funcion que busca los usuarios y si no existe devuelve null
User? buscarUsuario(String nombre) {
  try {
    return users.firstWhere((user) => user.name == nombre);
  } catch (e) {
    return null;
  }
}
