package com.eaprego.prohill.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Device {
    @Id
    @GeneratedValue
    private Long id;
    private String mac;

    //seter and getters used by thymeleaf
    public void setMac(String mac) {
        this.mac = mac;
    }

    public String getMac() {
        return mac;
    }
}
