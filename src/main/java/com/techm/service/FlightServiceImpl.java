package com.techm.service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.techm.entity.Flight;
import com.techm.entity.FlightStatus;

import com.techm.repository.FlightRepository;

@Service
public class FlightServiceImpl implements FlightService {
	@Autowired
	FlightRepository flightRepository;

	@Override
	public Flight addFlight(Flight flight) {
		return flightRepository.save(flight);
	}

	@Override
	public List<Flight> getAllFlights() {
		return flightRepository.findAll();
	}

	@Override
	public Flight getFlightById(Long id) {
		return flightRepository.findById(id).orElse(null);
	}

	@Override
	public Flight editFlight(Flight flight, Long id) {
		Optional<Flight> exsistingFlight = flightRepository.findById(id);
		if (exsistingFlight.isPresent()) {
			Flight flight2 = exsistingFlight.get();
			
			flight2.setFlightNumber(flight.getFlightNumber());
			flight2.setDepartureDate(flight.getDepartureDate());
			flight2.setSource(flight.getSource());
			flight2.setDestination(flight.getDestination());
			flight2.setArrivalTime(flight.getArrivalTime());
			flight2.setDepartureTime(flight.getDepartureTime());
			flight2.setPrice(flight.getPrice());
			flight2.setAvailableSeats(flight.getAvailableSeats());
			flight2.setFlightStatus(flight.getFlightStatus());

			Flight editedFlight = flightRepository.save(flight2);
			return editedFlight;
		} else {
			throw new IllegalArgumentException("Flight with Id not found");
		}
	}

	@Override
	public List<Flight> getScheduledFlight() {
		List<Flight> allFlights = flightRepository.findAll();
		List<Flight> scheduledFlights = allFlights.stream()
				.filter(flight -> flight.getFlightStatus() == FlightStatus.SCHEDULED).collect(Collectors.toList());
		return scheduledFlights;
	}
	
	@Override
	public List<Flight> findScheduledFlight(List<Flight> searchedflights) {
		
		List<Flight> scheduledFlights = searchedflights.stream()
				.filter(flight -> flight.getFlightStatus() == FlightStatus.SCHEDULED).collect(Collectors.toList());
		return scheduledFlights;
	}

	@Override
	public List<Flight> searchFlights(String source, String destination) {
		return flightRepository.findFlightBySourceAndDestination(source, destination);
	}

}