package com.practice.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.techm.entity.Booking;
import com.techm.entity.Flight;
import com.techm.entity.User;

@Repository
public interface BookingRepository extends JpaRepository<Booking, Long> {
	
	public List<Booking> findBookingsByUser(User user);
	
	public  List<Booking> findBookingsByFlight(Flight flight);
	
	public Booking findBookingByPnr(String pnr);
	
	 
}