import 'package:flutter/material.dart';
import 'package:moco_event_app/behaviours/scroll.behaviour.dart';
import 'package:moco_event_app/views/home.view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MOCO :: Events',
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(
          secondary: Color.fromRGBO(255, 191, 80, 1),
          tertiary: Colors.indigoAccent,
          primary: Color.fromRGBO(180, 139, 72, 1.0)
        )
      ),
      home: const MOCOHome(),
      scrollBehavior: MOCOScrollBehaviour(),
    );
  }
}


