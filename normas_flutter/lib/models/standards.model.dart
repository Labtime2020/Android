import 'package:normas_flutter/models/standard.model.dart';

class Standards {
  List<Standard> standards = [];

  Standards({this.standards});

  Standards.fromJson(List<dynamic> json) {
    if (json != null) {
      standards = new List<Standard>();
      json.forEach((v) {
        standards.add(new Standard.fromJson(v));
      });
    }
  }
  // Standards.fromJson(Map<String, dynamic> json) {
  //   if (json != null) {
  //     standards = new List<Standard>();
  //     json[0].forEach((v) {
  //       standards.add(new Standard.fromJson(v));
  //     });
  //   }
  // }

  // Standards.fromJson(List<dynamic> json) {
  //   if (json != null) {
  //     print(json);
  //     standards = new List<Standard>();
  //     json.forEach((v) {
  //       print("Norma: " + v["nome"]);
  //       Standard standard = Standard(
  //         nameStandard: v["nome"].toString(),
  //         descriptionStandard: v["descricao"].toString(),
  //         idStandard: int.parse(v["normaId"].toString()),
  //         isActiveStandard: bool.fromEnvironment(v["isActive"].toString()),
  //         views: int.parse(v["url"].toString()),
  //       );
  //       //     v["normaId"], v["visualizacoes"]);
  //       // standards.add(Standard(v["nome"], v["descricao"], v["url"], v["tags"],
  //       //     v["normaId"], v["visualizacoes"]));
  //     });
  //   }
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.standards != null) {
      data['standards'] = this.standards.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
