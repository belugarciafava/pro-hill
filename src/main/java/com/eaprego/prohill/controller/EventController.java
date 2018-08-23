package com.eaprego.prohill.controller;

import com.eaprego.prohill.service.EventService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(value = "/pro-hill", produces = MediaType.APPLICATION_JSON_VALUE)
public class EventController {
    @Autowired
    private EventService eventService;

    private static final Logger LOGGER = LoggerFactory.getLogger(EventController.class);

    @PostMapping("/events/{data}")
    public ResponseEntity<Void> addEvent(@PathVariable final String data) {
        LOGGER.info("Data {}", data);
        eventService.addEvent(data);
        return ResponseEntity.ok().build();
    }

    @GetMapping("/events")
    public ResponseEntity<List<String>> addEvent() {
        LOGGER.info("Getting All Events");
        return ResponseEntity.ok(eventService.getEvents());
    }

}
