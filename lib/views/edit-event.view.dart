
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:moco_event_app/entities/event.entity.dart';
import 'package:moco_event_app/states/event.state.dart';

class MOCOEditEventView extends StatefulWidget {

  final Event event;
  final ValueSetter<Event> onEdited;

  const MOCOEditEventView({Key? key, required this.event, required this.onEdited}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MOCOEditEventState();
  }

}
class _MOCOEditEventState extends State<MOCOEditEventView> {

  final _formKey = GlobalKey<FormState>();

  late TextEditingController _titleController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();

    _titleController = TextEditingController(text: widget.event.title);
    _descriptionController = TextEditingController(text: widget.event.description);
  }

  _saveEvent(BuildContext context) {
    if(_formKey.currentState!.validate()) {
      // Set values
      widget.event.title = _titleController.value.text;
      widget.event.description = _descriptionController.value.text;

      // Find index in global array for the event
      int index = EventState.findIndex(widget.event);

      // If index is -1, the event does not exist.
      if(index == -1) {
        // Show message to user
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Das Event kann nicht aktualisiert werden."),
          backgroundColor: Colors.redAccent,
        ));
        return;
      }

      // Continue with updating the state
      EventState.setAt(index, widget.event);
      widget.onEdited(widget.event);

      // Navigate back one page
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Event bearbeiten"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: ElevatedButton.icon(
                onPressed: () {
                  _saveEvent(context);
                },
                icon: const Icon(Icons.save),
                label: const Text("Speichern")
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(8),
              child: IconButton(onPressed: () {

              },
              icon: const Icon(Icons.delete)
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _titleController,
                    decoration: const InputDecoration(
                        labelText: "Name des Events",
                        hintText: "ABC-Event",
                    ),
                    validator: (value) {
                      if(value == null || value.isEmpty) {
                        return "Eingabe benötigt.";
                      }

                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _descriptionController,
                    decoration: const InputDecoration(
                        labelText: "Beschreibung",
                        hintText: "Thema des Events ist..."
                    ),
                    validator: (value) {
                      if(value == null || value.isEmpty) return null;
                      if(value.length > 120 || value.length < 3) {
                        return "Bitte gebe min. 3 und max. 120 Zeichen ein.";
                      }

                      return null;
                    },
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }

}