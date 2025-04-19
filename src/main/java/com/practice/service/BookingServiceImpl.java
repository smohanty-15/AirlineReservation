package com.practice.service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.techm.entity.Booking;
import com.techm.entity.BookingStatus;
import com.techm.entity.Flight;
import com.techm.entity.FlightStatus;
import com.techm.entity.User;
import com.techm.repository.BookingRepository;

import jakarta.servlet.http.HttpSession;

@Service
public class BookingServiceImpl implements BookingService {
	@Autowired
	BookingRepository bookingRepository;

	@Override
	public List<Booking> getAllBookings() {
		return bookingRepository.findAll();
	}

	@Override
	public List<Booking> getBookingsByUser(User user) {
		return bookingRepository.findBookingsByUser(user);
	}

	@Override
	public List<Booking> getBookingsByFlight(Flight flight) {
		return bookingRepository.findBookingsByFlight(flight);
	}


	@Override
	public Booking findByBookingId(Long bookingId) {
		return bookingRepository.findById(bookingId).orElse(null);
	}

	@Override
	public void cancelBookingserv(Long bookingId) {
		Booking booking = bookingRepository.findById(bookingId).orElse(null);
		if (booking != null) {
			booking.setBookingStatus(BookingStatus.CANCELLED);
			bookingRepository.save(booking);
		}
	}

	@Override
	public void confirmBookings(User user, Flight flight, int noOfSeat, String passanger2, String passanger3,
			String passanger4, HttpSession session) {
		int toSeat = 0;
		int fromSeat = 0;
		System.out.println("Flight (Available seat ) : " + flight.getAvailableSeats());
		if (flight != null && user != null) {
			// Update available seats
			int availableSeatsinFlight = flight.getAvailableSeats();
			toSeat = availableSeatsinFlight;
			if ((availableSeatsinFlight - noOfSeat) < 0) {
				System.out.println("NO SEAT in the flight");
				session.setAttribute("failedMsg", "NO SEAT AVAILABLE, PLEASE SELECT ANOTHER FLIGHT");
				return;
			}
			if (availableSeatsinFlight >= noOfSeat) {

				switch (noOfSeat) {
				case 1: {
					availableSeatsinFlight--;
					break;
				}
				case 2: {
					availableSeatsinFlight--;
					availableSeatsinFlight--;
					break;
				}
				case 3: {
					availableSeatsinFlight--;
					availableSeatsinFlight--;
					availableSeatsinFlight--;
					break;
				}
				case 4: {
					availableSeatsinFlight--;
					availableSeatsinFlight--;
					availableSeatsinFlight--;
					availableSeatsinFlight--;
					break;
				}
				}
				fromSeat = availableSeatsinFlight + 1;
			}
			flight.setAvailableSeats(flight.getAvailableSeats() - noOfSeat);
		}

		Booking booking = new Booking();
		booking.setFlight(flight);
		booking.setUser(user);
		booking.setBookingStatus(BookingStatus.CONFIRMED);
		booking.setNoOfSeat(noOfSeat);
		System.out.println("No Of Seat Want : " + noOfSeat);
		System.out.println("Available Seat :" + flight.getAvailableSeats());

		booking.setToSeatNo(toSeat);
		booking.setFromSeatNo(fromSeat);

		System.out.println("From Seat : " + fromSeat + "  " + "To Seat " + toSeat);

		booking.setPassanger2(passanger2);
		booking.setPassanger3(passanger3);
		booking.setPassanger4(passanger4);

		Random r1 = new Random();
		int n1 = r1.nextInt(1000, 9999);
		Random r2 = new Random();
		int n2 = r2.nextInt(1000, 9999);
		int nano = LocalDateTime.now().getNano();
		String strNano = nano + "";
		String newPnr = n1+""+ n2 + strNano.substring(0, 2);
		booking.setPnr(newPnr);

		bookingRepository.save(booking);

	}

	@Override
	public void changeBookingStatus(FlightStatus flightStatus, List<Booking> bookings) {

		for (Booking booking : bookings) {
			BookingStatus bookingStatus = booking.getBookingStatus();

			if (booking != null && flightStatus == FlightStatus.SCHEDULED
					&& bookingStatus == BookingStatus.FLIGHTCANCELLED) {

				booking.setBookingStatus(BookingStatus.CONFIRMED);
				bookingRepository.save(booking);

			} else if (booking != null && flightStatus == FlightStatus.CANCELLED
					&& bookingStatus == BookingStatus.CONFIRMED) {

				booking.setBookingStatus(BookingStatus.FLIGHTCANCELLED);
				bookingRepository.save(booking);

			}
		}
	}

	@Override
	public Booking getTicketDetails(String pnr) {
		return bookingRepository.findBookingByPnr(pnr);
	}

}
