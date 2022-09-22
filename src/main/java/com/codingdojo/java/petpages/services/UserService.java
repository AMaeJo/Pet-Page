package com.codingdojo.java.petpages.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.codingdojo.java.petpages.models.LoginUser;
import com.codingdojo.java.petpages.models.User;
import com.codingdojo.java.petpages.repositories.UserRepository;

@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepository;
	
	public User register(User newUser, BindingResult result) {
		Optional<User> getNewUser = userRepository.findByUserName(newUser.getUserName());
		
		if (getNewUser.isPresent()) {
			result.rejectValue("userName", "Mismath", "User name is already taken"); 
		}
		if (!newUser.getPassword().equals(newUser.getConfirmPassword())){
			result.rejectValue("confirmPassword", "Match", "Passwords do not match");
		}
		if (result.hasErrors()) {
			return null;
		}
		String hashedPW = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
		newUser.setPassword(hashedPW);
		return userRepository.save(newUser);
	}
	
	public User login(LoginUser newLogInUser, BindingResult result) {
			Optional<User> getNewLogInUser = userRepository.findByUserName(newLogInUser.getUserName());
			
			if (!getNewLogInUser.isPresent()) {
				result.rejectValue("userName", "Match", "Please enter a valid user name and/or password");
				return null;
			}
			User user = getNewLogInUser.get();
			
			if (!BCrypt.checkpw(newLogInUser.getPassword(), user.getPassword())) {
				result.rejectValue("userName", "Mismatch", "Please enter a valid user name and/or password");
				return null;
			}	
			if (result.hasErrors()) {
				return null;
			}
			return user;
		
		}
	
	
	public User getById(Long id) {
		return userRepository.findById(id).orElse(null);
	}


}
