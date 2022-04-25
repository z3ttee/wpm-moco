import 'package:flutter/material.dart';
import 'package:moco_event_app/states/event.state.dart';
import 'package:moco_event_app/views/create-event.view.dart';
import 'package:moco_event_app/views/home.view.dart';
import 'package:moco_event_app/widgets/lists/event-list.widget.dart';

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
        primarySwatch: Colors.blueGrey,
        backgroundColor: Colors.black38
      ),
      home: const MOCOHome(),
    );
  }
}


