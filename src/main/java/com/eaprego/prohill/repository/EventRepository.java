package com.eaprego.prohill.repository;

import com.eaprego.prohill.model.Event;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EventRepository extends JpaRepository<Event, Long> {
}
