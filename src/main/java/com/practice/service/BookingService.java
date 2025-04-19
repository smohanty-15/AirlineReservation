package com.practice.service;

import java.util.List;

import com.techm.entity.Booking;
import com.techm.entity.Flight;
import com.techm.entity.FlightStatus;
import com.techm.entity.User;

import jakarta.servlet.http.HttpSession;

public interface BookingService {

	List<Booking> getAllBookings();

	Booking findByBookingId(Long bookingId);

	void cancelBookingserv(Long bookingId);

	void changeBookingStatus(FlightStatus flightStatus, List<Booking> bookings);

	List<Booking> getBookingsByUser(User user);

	List<Booking> getBookingsByFlight(Flight flight);

	void confirmBookings(User user, Flight flight, int noOfSeat, String passanger2, String passanger3,
			String passanger4, HttpSession session);

	Booking getTicketDetails(String pnr);

}
