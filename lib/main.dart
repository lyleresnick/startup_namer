import 'package:flutter/material.dart';
import 'package:startup_namer_original/startup_name_favorite_list/startup_name_favorite_list_assembly.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator (Bloc)',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: StartupNameListAssembly().scene
    );
  }
}
