// import 'package:normas_flutter/utils/prefs.dart';
// import 'dart:convert' as convert;

import 'dart:io';

class Standard {
  String nameStandard;
  String descriptionStandard;
  String urlImageStandard;
  List<String> categoriesStandard;
  int idStandard = 0;
  int views;
  bool isActiveStandard;
  File fileStandard;

  Standard(
      {this.nameStandard,
      this.descriptionStandard,
      this.urlImageStandard,
      this.categoriesStandard,
      this.idStandard,
      this.views,
      this.isActiveStandard});

  Standard.fromJson(Map<String, dynamic> json) {
    this.nameStandard = json['nome'];
    this.descriptionStandard = json['descricao'];
    this.urlImageStandard = json['url'];
    this.categoriesStandard = json['tags'].cast<String>();
    this.idStandard = json['normaId'];
    this.views = json['visualizacao'];
    this.isActiveStandard = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nameStandard;
    data['descricao'] = this.descriptionStandard;
    data['url'] = this.urlImageStandard;
    data['categorias'] = this.categoriesStandard;
    data['id'] = this.idStandard;
    data['visualizacao'] = this.views;
    return data;
  }

  // static void clear() {
  //   Prefs.setString("standard.prefs", "");
  // }

  // Método para salvar o usuário
  // void save() {
  //   Map map = toJson();
  //   String json = convert.json.encode(map);
  //   Prefs.setString("standard.prefs", json);
  // }

  // Método para ler o usuário
  // static Future<Standard> get() async {
  //   String json = await Prefs.getString("standard.prefs");
  //   if (json.isEmpty) {
  //     return null;
  //   }

  //   Map map = convert.json.decode(json);

  //   Standard norma = Standard.fromJson(map);

  //   return norma;
  // }

  @override
  String toString() {
    return '{normaId: $idStandard, nome: $nameStandard, descricao: $descriptionStandard, url: $urlImageStandard, isActive: $isActiveStandard, tags: $categoriesStandard, views: $views}';
  }
}
