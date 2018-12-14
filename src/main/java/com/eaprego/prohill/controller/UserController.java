package com.eaprego.prohill.controller;

import com.eaprego.prohill.model.Client;
import com.eaprego.prohill.model.Device;
import com.eaprego.prohill.model.Event;
import com.eaprego.prohill.repository.ClientRepository;
import com.eaprego.prohill.repository.DeviceRepository;
import com.eaprego.prohill.repository.EventRepository;
import com.eaprego.prohill.service.EventService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.vote.AuthenticatedVoter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;
import java.util.Map;

@Controller
@Secured(AuthenticatedVoter.IS_AUTHENTICATED_FULLY)
public class UserController {

    private static final Logger LOGGER = LoggerFactory.getLogger(UserController.class);

    @Value("${welcome.message:test}")
    private String message = "Hello World";
    private final EventService eventService;
    private final ClientRepository clientRepository;
    private final DeviceRepository deviceRepostiroy;
    private final EventRepository eventRepository;

    @Autowired
    public UserController(EventService eventService, ClientRepository clientRepository, DeviceRepository deviceRepository,
                          EventRepository eventRepository) {
        this.eventService = eventService;
        this.clientRepository = clientRepository;
        this.deviceRepostiroy = deviceRepository;
        this.eventRepository = eventRepository;
    }

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

    @GetMapping("/adddeviceform")
    public String showDeviceForm(Device device) {
        return "add-device";
    }

    @PostMapping("/adddevice")
    public String addUser(@Valid Device device, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "add-device";
        }
        deviceRepostiroy.save(device);
        //model.addAttribute("users", userRepository.findAll());
        return "device";
    }

    @GetMapping("/clients")
    public String clients(Map<String, Object> model) {
        model.put("message", this.message);
        return "clients";
    }

    @GetMapping("/addclientform")
    public String showSignUpForm(Client user) {
        return "add-client";
    }

    @PostMapping("/addclient")
    public String addUser(@Valid Client client, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "add-client";
        }
        clientRepository.save(client);
        //model.addAttribute("users", userRepository.findAll());
        return "clients";
    }

    @GetMapping("/save_client")
    public String saveCleint(Map<String, Object> model) {
        model.put("message", this.message);
        return "save_client";
    }


    @GetMapping("/events")
    public String getEvents(final Model model) {
        LOGGER.info("Getting All Events");
        model.addAttribute("events", eventService.getEvents());
        return "events";
    }

    @GetMapping("/addeventform")
    public String showAddEventForm(Event event) {
        return "add-event";
    }

    @PostMapping("/addevent")
    public String addEvent(@Valid Event event, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "add-event";
        }
        eventRepository.save(event);
        //model.addAttribute("users", userRepository.findAll());
        return "events";
    }
}
