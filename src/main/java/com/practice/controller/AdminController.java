package com.practice.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.techm.entity.Admin;
import com.techm.entity.Booking;
import com.techm.entity.Flight;
import com.techm.entity.FlightStatus;
import com.techm.service.AdminService;
import com.techm.service.BookingService;
import com.techm.service.FlightService;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private AdminService adminService;
	@Autowired
	private FlightService flightService;
	@Autowired
	private BookingService bookingService;

	// Admin login
	@GetMapping("/login")
	public String adminloginPage() {
		return "admin/AdminLoginForm";
	}

	@PostMapping("/adminlogin")
	public String loginAdmin(@RequestParam String email, @RequestParam String password, Model model,
			HttpSession session) {
		Admin admin = adminService.loginAdmin(email, password);
		if (admin != null) {
			session.setAttribute("loggedInAdmin", admin);
			return "redirect:dashboard";
		} else {
			session.setAttribute("errorMessage", "Incorrect email or password");
			return "admin/AdminLoginForm";
		}
	}

	@GetMapping("/logout")
	public String adminlogoutPage(HttpSession session) {
		session.invalidate();
		return "redirect:../home";
	}

	@GetMapping("/dashboard")
	public String admindashboard(HttpSession session) {
		if (session.getAttribute("loggedInAdmin") != null)
			return "admin/AdminDashboard";
		return "redirect:login";
	}

// Adding a new Flight
	@GetMapping("/flight/add")
	public String addFlightPage(Model model, HttpSession session) {
		if (session.getAttribute("loggedInAdmin") != null) {
			model.addAttribute("flight", new Flight());
			return "admin/NewFlightForm";
		}
		return "redirect:../login";
	}

	@PostMapping("/addflight")
	public String addFlight(@ModelAttribute("flight") Flight flight) {
		flightService.addFlight(flight);
		return "redirect:flight/view";
	}

	// view flight list
	@GetMapping("/flight/view")
	public String showFlightList(Model model, HttpSession session) {
		if (session.getAttribute("loggedInAdmin") != null) {
			List<Flight> flights = flightService.getAllFlights();
			model.addAttribute("flights", flights);
			return "admin/FlightListAdmin";
		}
		return "redirect:../login";
	}

//editing the flight details 
	@GetMapping("/flight/edit/{id}")
	public String showEditFlightForm(@PathVariable("id") Long id, HttpSession session) {
		if (session.getAttribute("loggedInAdmin") != null) {
			Flight flight = flightService.getFlightById(id);
			session.setAttribute("editFlight", flight);
			return "admin/EditFlightForm";
		}
		return "redirect:../../login";
	}

	@PostMapping("/editFlight/{id}")
	public String editFlight(@ModelAttribute("booking") Booking booking, @ModelAttribute("flight") Flight flight,
			@PathVariable("id") Long id) {

		Flight editedFLight = flightService.editFlight(flight, id);
		FlightStatus flightStatus = editedFLight.getFlightStatus();
		List<Booking> bookings = bookingService.getBookingsByFlight(flight);
		bookingService.changeBookingStatus(flightStatus, bookings);
		return "redirect:/admin/flight/view";
	}

	// view list of bookings
	@GetMapping("/bookings")
	public String viewAllBookings(Model model, HttpSession session) {
		if (session.getAttribute("loggedInAdmin") != null) {
			List<Booking> bookings = bookingService.getAllBookings();
			model.addAttribute("viewbookings", bookings);
			return "admin/ViewAllBookings";
		}
		return "redirect:login";
	}
}
