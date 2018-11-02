package com.eaprego.prohill.controller;

import com.eaprego.prohill.service.EventService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.vote.AuthenticatedVoter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Map;

@Controller
@Secured(AuthenticatedVoter.IS_AUTHENTICATED_FULLY)
public class UserController {

    private static final Logger LOGGER = LoggerFactory.getLogger(UserController.class);

    @Autowired
    private EventService eventService;

    // inject via application.properties
    @Value("${welcome.message:test}")
    private String message = "Hello World";

    @GetMapping("/")
    public String welcome(Map<String, Object> model) {
        model.put("message", this.message);
        return "events";
    }

    @GetMapping("/device")
    public String device(Map<String, Object> model) {
        model.put("message", this.message);
        return "device";
    }

    @GetMapping("/clients")
    public String clients(Map<String, Object> model) {
        model.put("message", this.message);
        return "clients";
    }

    @GetMapping("/events")
    public String getEvents(final Model model) {
        LOGGER.info("Getting All Events");
        model.addAttribute("events", eventService.getEvents());
        return "events";
    }
}
