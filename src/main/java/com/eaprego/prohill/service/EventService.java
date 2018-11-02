package com.eaprego.prohill.service;

import com.eaprego.prohill.model.Event;
import com.eaprego.prohill.util.Base64Util;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class EventService {
    private List<Event> events = new ArrayList<Event>();

    public void addEvent(String data) {
        final String[] elements = data.split(",", 3);
        String decodedEvent = Base64Util.decode(elements[2]);
        System.out.println("Decoded: " + decodedEvent);
        this.events.add(new Event(new Random().nextLong(), elements[0], decodedEvent));
    }

    public List<Event> getEvents() {
        return this.events;
    }
}
