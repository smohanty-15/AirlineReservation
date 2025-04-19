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

import com.techm.entity.Booking;
import com.techm.entity.Flight;
import com.techm.entity.User;
import com.techm.service.BookingService;
import com.techm.service.FlightService;
import com.techm.service.UserService;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;
	@Autowired
	private FlightService flightService;
	@Autowired
	private BookingService bookingService;

	// register new user
	@GetMapping("/register")
	public String registerPage(Model model) {
		model.addAttribute("user", new User());
		return "user/RegisterFormUser";
	}

	@PostMapping("/registeruser")
	public String registerUser(@ModelAttribute("user") User user, HttpSession session) {

		if (userService.registerUser(user)) {
			session.setAttribute("successMessage", "Registration Successful");
			return "redirect:login";
		} else {
			session.setAttribute("duplicateMessage", "Email Already Exist, please select another email");
			return "redirect:register";
		}

	}


	// login user
	@GetMapping("/login")
	public String loginPage() {
		return "user/LoginFormUser";
	}

	@PostMapping("/loginuser")
	public String loginUser(@RequestParam String email, @RequestParam String password, HttpSession session) {
		User user = userService.loginUser(email, password);
		if (user != null) {
			session.setAttribute("loggedInUser", user);
			session.setAttribute("loggedInUserId", user.getId());
			return "redirect:dashboard";
		} else {
			session.setAttribute("errorMessage", "Incorrect email or password");
			return "user/LoginFormUser";
		}
	}

	@GetMapping("/contactus")
	public String contactUs() {
		return "home/contactUs";
	}

	@GetMapping("/profile")
	public String Profile(HttpSession session) {
		if (session.getAttribute("loggedInUser") != null)
			return "user/ProfileView";
		return "redirect:login";
	}

	@GetMapping("/logout")
	public String logoutPage(HttpSession session) {
		session.invalidate(); // delete all data from session
		return "redirect:../home";
	}

	@GetMapping("/dashboard")
	public String dashboard(HttpSession session) {
		if (session.getAttribute("loggedInUser") != null)
			return "user/UserDashboard";
		return "redirect:login";
	}

	// view list of flight
	@GetMapping("/flight/view")
	public String showAvailableFlight(Model model, HttpSession session) {
		if (session.getAttribute("loggedInUser") != null) {
			List<Flight> flights = flightService.getScheduledFlight();
			model.addAttribute("flights", flights);
			return "user/AvailableFlightListUser";
		}
		return "redirect:../login";
	}

	@GetMapping("/flight/search")
	public String searchFlight(@RequestParam("source") String source, @RequestParam("destination") String destination,
			Model model, HttpSession session) {
		if (session.getAttribute("loggedInUser") != null) {

			List<Flight> searchedflights = flightService.searchFlights(source, destination);

			List<Flight> flights = flightService.findScheduledFlight(searchedflights);

			session.setAttribute("searchflights", flights);
			return "user/SearchedFlightsUser";
		}
		return "redirect:../login";

	}

	// for add new booking
	@GetMapping("/bookticket-seat") // 1
	public String bookTicketseat(@RequestParam("flightId") Long flightId, @RequestParam("userId") Long userId,
			Model model, HttpSession session) {
		if (session.getAttribute("loggedInUser") != null) {
			model.addAttribute("flightId", flightId);
			model.addAttribute("userId", userId);
			return "user/EnterBookingDetails";
		}
		return "redirect:login";
	}

	@PostMapping("/bookticket") // 2
	public String bookTicket(@RequestParam("noOfSeat") int noOfSeat, @RequestParam("passanger2") String passanger2,
			@RequestParam("passanger3") String passanger3, @RequestParam("passanger4") String passanger4,
			@RequestParam("userId") Long userId, @RequestParam("flightId") Long flightId, Model model,
			HttpSession session) {

		Flight flight = flightService.getFlightById(flightId);
		User user = userService.getUserById(userId);
		model.addAttribute("noOfSeat", noOfSeat);
		model.addAttribute("passanger2", passanger2);
		model.addAttribute("passanger3", passanger3);
		model.addAttribute("passanger4", passanger4);
		model.addAttribute("flight", flight);
		model.addAttribute("user", user);
		return "user/ConfirmBookingPage";

	}

	@PostMapping("/confirmBooking") // 3
	public String confirmBooking(@RequestParam("flightId") Long flightId, @RequestParam("userId") Long userId,
			@RequestParam("noOfSeat") int noOfSeat, @RequestParam("passanger2") String passanger2,
			@RequestParam("passanger3") String passanger3, @RequestParam("passanger4") String passanger4, Model model,
			HttpSession session) {
		if (session.getAttribute("loggedInUser") != null) {

			Flight flight = flightService.getFlightById(flightId);
			User user = userService.getUserById(userId);

			bookingService.confirmBookings(user, flight, noOfSeat, passanger2, passanger3, passanger4, session);

			return "redirect:/user/viewbookings/" + userId;
		}
		return "redirect:login";

	}

	// view my bookings histoty
	@GetMapping("/viewbookings/{user}")
	public String viewAllBookings(@PathVariable("user") User user, Model model, HttpSession session) {
		if (session.getAttribute("loggedInUser") != null) {
			List<Booking> bookings = bookingService.getBookingsByUser(user);
			model.addAttribute("viewbookings", bookings);
			return "user/ViewBookingHistory"; // This corresponds to the JSP page name
		}
		return "redirect:../login";
	}

	// to delete a flight booking
	@GetMapping("/booking/cancel/{bookingId}")
	public String showCancelBookingForm(@PathVariable("bookingId") Long bookingId, Model model, HttpSession session) {
		if (session.getAttribute("loggedInUser") != null) {
			Booking booking = bookingService.findByBookingId(bookingId);
			model.addAttribute("booking", booking);

			return "user/CancelBookingForm";
		}
		return "redirect:../../login";

	}

	@PostMapping("/booking/cancel/{bookingId}")
	public String cancelBooking(@PathVariable("bookingId") Long bookingId, HttpSession session) {
		if (session.getAttribute("loggedInUser") != null) {
			bookingService.cancelBookingserv(bookingId);
			return "redirect:../../dashboard";
		}
		return "redirect:../../login";
	}

	// print the ticket
	@GetMapping("/print/ticket/{bookingId}")
	public String printTicket(@PathVariable("bookingId") Long bookingId, Model model, HttpSession session) {
		if (session.getAttribute("loggedInUser") != null) {
			Booking booking = bookingService.findByBookingId(bookingId);
			model.addAttribute("booking", booking);
			return "user/ViewTicket"; // This corresponds to the JSP page name
		}
		return "redirect:../../login";
	}
}
