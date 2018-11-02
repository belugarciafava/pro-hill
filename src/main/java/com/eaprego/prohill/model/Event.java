package com.eaprego.prohill.model;

public class Event {
    private Long id;
    private String mac;
    private String description;

    public Event(Long id, String mac, String description) {
        this.id = id;
        this.mac = mac;
        this.description = description;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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
