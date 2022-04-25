import 'package:flutter/material.dart';
import '../states/event.state.dart';
import '../widgets/lists/event-list.widget.dart';
import 'create-event.view.dart';

class MOCOHome extends StatefulWidget {
  const MOCOHome({Key? key}) : super(key: key);

  @override
  State<MOCOHome> createState() => _MOCOHomeState();
}

class _MOCOHomeState extends State<MOCOHome> {
  EventState state = EventState();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("MOCO :: Events"),
      ),
      body: Column(
        children: [
          EventListWidget(
              events: state.events
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MOCOCreateEventView())
          );
        },
        tooltip: 'Event anlegen',
        child: const Icon(Icons.add),
      ),
    );
  }
}