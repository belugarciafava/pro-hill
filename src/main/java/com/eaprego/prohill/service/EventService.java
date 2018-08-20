package com.eaprego.prohill.service;

import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class EventService {
    private List<String> events = new ArrayList<String>();

    public void addEvent(String event) {
        this.events.add(event);
    }

    public List<String> getEvents() {
        return this.events;
    }
}
