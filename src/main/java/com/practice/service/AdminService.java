package com.practice.service;

import com.practice.entity.Admin;

public interface AdminService {
	public void registerAdmin(Admin admin);

	Admin loginAdmin(String email, String password);
	
}