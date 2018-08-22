package com.eaprego.prohill.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.vote.AuthenticatedVoter;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

@Controller
@Secured(AuthenticatedVoter.IS_AUTHENTICATED_FULLY)
public class UserController {

    // inject via application.properties
    @Value("${welcome.message:test}")
    private String message = "Hello World";

    @GetMapping("/")
    public String welcome(Map<String, Object> model) {
        model.put("message", this.message);
        return "welcome";
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
}
