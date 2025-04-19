package com.practice.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.techm.entity.User;
import com.techm.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserRepository userRepository;

	@Override
	public Boolean registerUser(User user) {
		Optional<User> existingUser = userRepository.findByEmail(user.getEmail());
		if (existingUser.isEmpty()) {
			userRepository.save(user);
			return true;
		}
		return false;
	}

	@Override
	public User loginUser(String email, String password) {
		Optional<User> user = userRepository.findByEmail(email);
		if (user.isPresent() && user.get().getPassword().equals(password)) {
			return user.get();
		}
		return null;
	}

	@Override
	public User getUserById(Long id) {
		return userRepository.findById(id).orElse(null);
	}

}