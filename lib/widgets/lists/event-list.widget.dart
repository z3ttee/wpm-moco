
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:moco_event_app/entities/event.entity.dart';

class EventListWidget extends StatelessWidget {

  final List<Event> events;
  final ValueSetter<Event> onPressed;

  const EventListWidget({
    Key? key,
    required this.events,
    required this.onPressed
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
                  fontSize: 22,
                  fontWeight: FontWeight.w700
                ),
              )
          ),
        ),

        if(events.isEmpty)
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Row(
                  children: const [
                    Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: Icon(Icons.info,
                          color: Colors.white60,
                        )
                    ),
                    Text(
                      "Keine Events geplant",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white70
                      ),
                    )
                  ],
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
                child: GestureDetector(
                  onTap: () {
                    onPressed(events[index]);
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.black26,
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
                      ),
                    ),
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