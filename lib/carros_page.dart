import 'package:flutter/material.dart';
import 'package:flutter_provider_exemple/carro.dart';
import 'package:flutter_provider_exemple/carros_list.dart';
import 'package:flutter_provider_exemple/carros_model.dart';
import 'package:provider/provider.dart';

class CarrosPage extends StatefulWidget {
  @override
  _CarrosPageState createState() => _CarrosPageState();
}

class _CarrosPageState extends State<CarrosPage>
    with AutomaticKeepAliveClientMixin<CarrosPage> {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    CarrosModel model = Provider.of<CarrosModel>(context, listen: false);
    model.getCarros();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    CarrosModel model = Provider.of<CarrosModel>(context);

    List<Carro> carros = model.carros;

    if (carros.isEmpty) {
      return Center(
        child: Text(
          "Nenhum carro foi encontrado!",
          style: TextStyle(fontSize: 25),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: CarrosList(carros),
    );
  }

  Future<void> _onRefresh() {
    CarrosModel model = Provider.of<CarrosModel>(context, listen: false);
    return model.getCarros();
  }
}
