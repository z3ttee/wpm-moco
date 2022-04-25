
import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:moco_event_app/entities/event.entity.dart';

class EventListWidget extends StatelessWidget {

  final List<Event> events;

  const EventListWidget({
    Key? key,
    required this.events
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Text(
                "Anstehende Events",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              )
          ),
        ),
        SizedBox(
          height: 400,
          child: PageView.builder(
            itemCount: events.length,
            controller: PageController(viewportFraction: 0.8),
            dragStartBehavior: DragStartBehavior.start,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.all(Radius.circular(12))
                  ),
                  child: SizedBox.expand(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(events[index].title)
                          ],
                        ),
                      )
                  ),
                ),
              );
            }
          ),
        )
      ],
    );
  }

}