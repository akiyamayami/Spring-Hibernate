package com.example.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.example.dao.UserRepository;
import com.example.model.User;

@Service
@Transactional
public class UserService {
	
private final UserRepository userRepository;
	
	public UserService(UserRepository userRepository){
		this.userRepository = userRepository;
	}
	
	public boolean checkpass(String id, String password){
		User user = userRepository.findOne(id);
		if(user != null && user.getPassword().equals(password))
			return true;
		return false;
			
	}
	public User findUser(String id){
		return userRepository.findOne(id);
		
	}
}
