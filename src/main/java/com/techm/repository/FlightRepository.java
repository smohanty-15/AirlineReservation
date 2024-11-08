 package com.techm.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.techm.entity.Flight;

@Repository
public interface FlightRepository extends JpaRepository<Flight, Long>{
	  
       List<Flight> findFlightBySourceAndDestination(String source, String destination);
      
}