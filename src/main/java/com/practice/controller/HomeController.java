package com.practice.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.techm.entity.Booking;
import com.techm.entity.Flight;
import com.techm.service.BookingService;
import com.techm.service.FlightService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/home")
public class HomeController {
   @Autowired
   private FlightService flightService;
   @Autowired
   private BookingService bookingService;
	
	@GetMapping("")
	public String homepage() {
		return "home/HomePage";
	}
	

	@GetMapping("/pnr")
	public String pnrcheckpage() {
		return "home/EnterPNR";
	}
	
	
	@PostMapping("/pnrcheck")
	public String pnrckeck(@RequestParam("pnr") String pnr, HttpSession session) {
		Booking booking=bookingService.getTicketDetails(pnr);
		session.setAttribute("bookingDetails", booking);
		return "home/PrintTicket";
	}
	
	
	@GetMapping("/searchflight")
	public String showSearchedFlightHome(@RequestParam("source") String source,
			@RequestParam("destination") String destination, HttpSession session) {
		List<Flight> flights = flightService.searchFlights(source, destination);
		session.setAttribute("flightssearchhome", flights);
		return "home/SearchFlightsListHome";
	}
	
}
