package com.comp3820sef.webapp.service;


import com.comp3820sef.webapp.entity.Users;
import com.comp3820sef.webapp.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.Objects;

@Service
public class UsersService{

    @Autowired
    private UserRepository userRepository;

    @Value("${teacher.passcode}") // get the passcode in the application properties
    private String TEACHER_PASSCODE;

    public void addUser(Users user, String passcode) {

        if (userRepository.findByUsername(user.getUsername()) != null) {
            throw new IllegalArgumentException("Username already exists");
        } else if (userRepository.findByEmail(user.getEmail()) != null) {
            throw new IllegalArgumentException("Email already exists");
        }

        if (Objects.equals(user.getRoles(), "teacher")) {
            if (passcode.equals(TEACHER_PASSCODE)) {
                user.setRoles("teacher");
            } else {
                throw new IllegalArgumentException("Wrong teacher passcode");
            }
        }
        userRepository.save(user);
    }
}
