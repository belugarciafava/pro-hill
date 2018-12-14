package com.eaprego.prohill.repository;

import com.eaprego.prohill.model.Device;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DeviceRepository extends JpaRepository<Device,Long> {
}
