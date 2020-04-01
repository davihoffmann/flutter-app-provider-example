import 'package:flutter/material.dart';
import 'package:flutter_provider_exemple/carro.dart';
import 'package:flutter_provider_exemple/carro_service.dart';

class CarrosModel extends ChangeNotifier {
  List<Carro> carros = [];

  Future<List<Carro>> getCarros() async {
    this.carros = await CarroService.getCarros();

    notifyListeners();

    return carros;
  }

}
