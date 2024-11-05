package com.techm.service;


import com.techm.entity.User;

public interface UserService {
	public Boolean registerUser(User user);
	public User loginUser(String email, String password);	
	public User getUserById(Long id);
}
