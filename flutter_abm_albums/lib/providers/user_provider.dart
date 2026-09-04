// lib/providers/user_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

class User {

   String name;
   String mail;
   String pass;


    User({
      required this.name,
      required this.mail,
      required this.pass,
    });
}

final userListProvider = StateProvider<List<User>>((ref) => [
  User(name: 'fungi', mail: 'fungi@mail.com', pass: '1234abc'),
  User(name: 'ammanita', mail: 'ammanita@mail.com', pass: 'abc1234'),
  User(name: 'grace', mail: 'grace@mail.com', pass: 'rocky123'),
]);

final userByMailProvider = Provider.autoDispose.family<User?, String>((ref, mail) {
  final users = ref.watch(userListProvider);
  try {
    return users.firstWhere((user) => user.mail == mail);
  } catch (e) {
    return null;
  }
});