import 'dart:convert';

import 'package:flutter_provider_exemple/http_base.dart' as http;
import 'package:flutter_provider_exemple/carro.dart';

class TipoCarro {
  static const String CLASSICO = "classicos";
  static const String ESPORTIVO = "esportivos";
  static const String LUXO = "luxo";
}

class CarroService {
  static Future<List<Carro>> getCarros() async {
    var url = 'https://carros-springboot.herokuapp.com/api/v1/carros';

    print("GET > $url");

    var response = await http.get(url);

    List list = json.decode(response.body);

    List<Carro> carros = list.map<Carro>((map) => Carro.fromMap(map)).toList();

    return carros;
  }

}
