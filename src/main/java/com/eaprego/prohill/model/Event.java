package com.eaprego.prohill.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Event {
    @Id
    @GeneratedValue
    private Long id;
    private String mac;
    private String description;

    public Event(Long id, String mac, String description) {
        this.id = id;
        this.mac = mac;
        this.description = description;
    }

//getters and setters and default constructor used by thymeleaf


    public Event() {
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getMac() {
        return mac;
    }

    public void setMac(String mac) {
        this.mac = mac;
    }

    @Override
    public String toString() {
        return "Event{" +
                "id=" + id +
                ", description='" + description + '\'' +
                '}';
    }
}
