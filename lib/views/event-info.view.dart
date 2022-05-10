import 'package:flutter/material.dart';
import 'package:moco_event_app/entities/event.entity.dart';
import 'package:moco_event_app/states/event.state.dart';
import 'package:moco_event_app/views/edit-event.view.dart';

class MOCOEventInfoView extends StatefulWidget {

  final Event event;
  final ValueSetter<Event> onChanged;
  final ValueSetter<Event> onRemoved;
  const MOCOEventInfoView({Key? key, required this.event, required this.onChanged, required this.onRemoved}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MOCOEventInfoViewState();
  }
}

class _MOCOEventInfoViewState extends State<MOCOEventInfoView> {

  _setEvent(Event event) {
    setState(() {
      widget.event.title = event.title;
      widget.event.description = event.description;

      widget.onChanged(widget.event);
    });
  }

  _removeEvent(BuildContext context, Event event) {
    setState(() {
      int index = EventState.findIndex(event);
      widget.onRemoved(EventState.deleteAt(index));
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: ElevatedButton(
                onPressed: () {
                  _removeEvent(context, widget.event);
                },
                child: const Text("Löschen"),
              ),
            )
          ],
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.event.title, style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                  )),
                  Text(widget.event.description, style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal
                  ))
                ],
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MOCOEditEventView(
                    event: widget.event,
                    onEdited: (event) {
                      _setEvent(event);
                    }
                ))
            );
          },
          tooltip: "Event bearbeiten",
          child: const Icon(Icons.edit),
        ),
    );
  }

}