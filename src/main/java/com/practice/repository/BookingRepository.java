package com.practice.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.practice.entity.Booking;
import com.practice.entity.Flight;
import com.practice.entity.User;

@Repository
public interface BookingRepository extends JpaRepository<Booking, Long> {
	
	public List<Booking> findBookingsByUser(User user);
	
	public  List<Booking> findBookingsByFlight(Flight flight);
	
	public Booking findBookingByPnr(String pnr);
	
	 
}