package com.techm.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Booking {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long bookingId;
	@ManyToOne
	@JoinColumn(name = "user_id")
	@JsonBackReference
	private User user;
	@ManyToOne
	@JoinColumn(name = "flight_id")
	@JsonBackReference
	private Flight flight;
	private int fromSeatNo;
	private int toSeatNo;
	private int noOfSeat;

	private String passanger2;
	private String passanger3;
	private String passanger4;
	
	@Column(unique = true)
	private String pnr;

	@Enumerated(EnumType.STRING)
	private BookingStatus bookingStatus = BookingStatus.CONFIRMED;

}