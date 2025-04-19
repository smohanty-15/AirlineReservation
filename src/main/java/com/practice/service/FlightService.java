package com.practice.service;

import java.util.List;

import com.techm.entity.Flight;

public interface FlightService {
	List<Flight> getAllFlights();

	List<Flight> getScheduledFlight();

	List<Flight> searchFlights(String source, String destination);

	Flight addFlight(Flight flight);

	public Flight editFlight(Flight flight, Long id);

	Flight getFlightById(Long id);

	List<Flight> findScheduledFlight(List<Flight> searchedflights);

}
