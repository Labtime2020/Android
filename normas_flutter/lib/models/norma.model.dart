import 'package:normas_flutter/utils/prefs.dart';
import 'dart:convert' as convert;

class User {
  String name;
  String lastname;
  String email;
  String password;
  String token;

  User({
    this.name,
    this.lastname,
    this.email,
    this.password,
    this.token,
  });

  User.fromJson(Map<String, dynamic> json) {
    this.name = json['nome'];
    this.email = json['email'];
    this.password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.name;
    data['email'] = this.email;
    return data;
  }

  static void clear() {
    Prefs.setString("user.prefs", "");
  }

  // Método para salvar o usuário
  void save() {
    Map map = toJson();
    String json = convert.json.encode(map);
    Prefs.setString("user.prefs", json);
  }

  // Método para ler o usuário
  static Future<User> get() async {
    String json = await Prefs.getString("user.prefs");
    if (json.isEmpty) {
      return null;
    }

    Map map = convert.json.decode(json);

    User user = User.fromJson(map);

    return user;
  }

  @override
  String toString() {
    return 'User{nome: $name, email $email, senha: $password,}';
  }
}
