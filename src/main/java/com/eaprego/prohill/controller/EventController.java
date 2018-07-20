package com.eaprego.prohill.controller;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/pro-hill", produces = MediaType.APPLICATION_JSON_VALUE)
public class EventController {

    @GetMapping("/events")
    public ResponseEntity<Void> addEvent() {
        return ResponseEntity.ok().build();
    }

}
