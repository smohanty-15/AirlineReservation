package com.techm.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.techm.entity.Admin;

@Repository
public interface AdminRepository extends JpaRepository<Admin, Long> {
	Optional<Admin> findByEmail(String email);
}
