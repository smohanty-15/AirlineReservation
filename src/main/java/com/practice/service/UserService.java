package com.practice.service;


import com.practice.entity.User;

public interface UserService {
	public Boolean registerUser(User user);
	public User loginUser(String email, String password);	
	public User getUserById(Long id);
}
