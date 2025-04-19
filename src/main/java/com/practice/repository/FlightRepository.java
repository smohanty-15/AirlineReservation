 package com.practice.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.practice.entity.Flight;

@Repository
public interface FlightRepository extends JpaRepository<Flight, Long>{
	  
       List<Flight> findFlightBySourceAndDestination(String source, String destination);
      
}