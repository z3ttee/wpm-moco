
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:moco_event_app/entities/event.entity.dart';

class MOCOCreateEventView extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  final ValueSetter<Event> onCreated;

  MOCOCreateEventView({Key? key, required this.onCreated}) : super(key: key);

  _saveEvent(BuildContext context) {
    if(_formKey.currentState!.validate()) {
      var event = Event(_titleController.value.text, _descriptionController.value.text, DateTime.now(), DateTime.now());

      if (kDebugMode) {
        print(event.title);
      }

      onCreated(event);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Neues Event anlegen"),
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
      ),
    );
  }

}