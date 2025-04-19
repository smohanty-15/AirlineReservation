package com.practice.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.techm.entity.Admin;

import com.techm.repository.AdminRepository;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminRepository adminRepository;

	@Override
	public Admin loginAdmin(String email, String password) {
		Optional<Admin> admin = adminRepository.findByEmail(email);

		if (admin.isPresent() && admin.get().getPassword().equals(password)) {
			return admin.get();
		}
		return null;
	}

	@Override
	public void registerAdmin(Admin admin) {

		adminRepository.save(admin);
	}

}
