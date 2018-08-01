package com.eaprego.prohill.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(value = "/pro-hill", produces = MediaType.APPLICATION_JSON_VALUE)
public class EventController {
    private static final Logger LOGGER = LoggerFactory.getLogger(EventController.class);

    @PostMapping("/events")
    public ResponseEntity<Void> addEvent(@RequestBody final String body) {
        LOGGER.info("Body {}", body);
        return ResponseEntity.ok().build();
    }

    @GetMapping("/events")
    public ResponseEntity<Void> addEvent() {
        LOGGER.info("Getting All Events");
        return ResponseEntity.ok().build();
    }

}
