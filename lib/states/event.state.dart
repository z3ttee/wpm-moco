
import 'package:moco_event_app/entities/event.entity.dart';

class EventState {

    static final List<Event> events = [];

    static setAt(int index, Event event) {
        EventState.events[index] = event;
    }

    static int findIndex(Event event) {
        for(int i = 0; i < EventState.events.length; i++) {
            Event e = EventState.events[i];

            if(e.id == event.id) {
                return i;
            }
        }

        return -1;
    }

    static deleteAt(int index) {
        return EventState.events.removeAt(index);
    }

}