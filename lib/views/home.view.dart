import 'package:flutter/material.dart';
import 'package:moco_event_app/entities/event.entity.dart';
import 'package:moco_event_app/views/event-info.view.dart';
import '../states/event.state.dart';
import '../widgets/lists/event-list.widget.dart';
import 'create-event.view.dart';

class MOCOHome extends StatefulWidget {
  const MOCOHome({Key? key}) : super(key: key);

  @override
  State<MOCOHome> createState() => _MOCOHomeState();
}

class _MOCOHomeState extends State<MOCOHome> {

  _addEvent(BuildContext context, Event event) {
    setState(() {
      EventState.events.add(event);
    });

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Neues Event angelegt.")
    ));
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: const Text("Deine Eventübersicht"),
      ),
      body: Column(
        children: [
          EventListWidget(
              events: EventState.events,
              onPressed: (event) {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MOCOEventInfoView(
                        event: event,
                        onChanged: (event) {
                          setState(() {});
                        },
                      onRemoved: (event) {
                          setState(() {});
                      },
                    ))
                );
              },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MOCOCreateEventView(
                onCreated: (event) => _addEvent(context, event),
              ))
          );
        },
        tooltip: 'Event anlegen',
        child: const Icon(Icons.add),
      ),
    );
  }
}