import 'package:flutter/material.dart';
import 'package:flutter_provider_exemple/carros_model.dart';
import 'package:flutter_provider_exemple/carros_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CarrosModel>(
          create: (context) => CarrosModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            //brightness: Brightness.dark,
            scaffoldBackgroundColor: Colors.white),
        home: Container(child: CarrosPage(), color: Colors.white,),
      ),
    );
  }
}