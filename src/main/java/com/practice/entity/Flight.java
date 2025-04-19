package com.practice.entity;

import java.sql.Date;
import java.time.LocalDateTime;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Flight {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@Column(nullable = false, unique = true)
	private String flightNumber;
	private Date departureDate;
	private String source;
	private String destination;
	private LocalDateTime departureTime;
	private LocalDateTime arrivalTime;
	private Double price;
	private int availableSeats;
	@Enumerated(EnumType.STRING)
	private FlightStatus flightStatus = FlightStatus.SCHEDULED;

	@OneToMany(mappedBy = "flight")
	@JsonManagedReference
	@JsonIgnore
	private List<Booking> bookings;

	@Override
	public String toString() {
		return "Flight [id=" + id + ", flightNumber=" + flightNumber + ", departureDate=" + departureDate + ", source="
				+ source + ", destination=" + destination + ", departureTime=" + departureTime + ", arrivalTime="
				+ arrivalTime + ", price=" + price + ", availableSeats=" + availableSeats + ", flightStatus="
				+ flightStatus + "]";
	}

}
