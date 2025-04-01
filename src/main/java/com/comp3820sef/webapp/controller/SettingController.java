package com.comp3820sef.webapp.controller;

import com.comp3820sef.webapp.entity.UserPrincipal;
import com.comp3820sef.webapp.entity.Users;
import com.comp3820sef.webapp.repository.UserRepository;
import com.comp3820sef.webapp.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class SettingController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private UsersService usersService;

    @Value("${teacher.passcode}")
    private String TEACHER_PASSCODE;

    @GetMapping("/setting")
    public String setting(@AuthenticationPrincipal UserPrincipal user, Model model) {
        List<Users> users = userRepository.findAll();

        List<Users> teachers = users.stream()
                .filter(userItem -> !userItem.getRoles().equals("student"))
                .toList();

        List<Users> students = users.stream()
                .filter(userItem -> userItem.getRoles().equals("student"))
                .toList();

        String role = user.getUserRole();
        int currentUserId = user.getUserId();

        model.addAttribute("role", role);
        model.addAttribute("currentUserId", currentUserId);
        model.addAttribute("students", students);
        model.addAttribute("teachers", teachers);
        return "setting";
    }

    @PostMapping("/userAction")
    public String userAction(@AuthenticationPrincipal UserPrincipal user,
                           @RequestParam("formType") String formType,
                           @RequestParam("userId") int userId,
                           @RequestParam("fullName") String fullName,
                           @RequestParam("password") String password,
                           @RequestParam("username") String username,
                           @RequestParam("email") String email,
                           @RequestParam("phoneNumber") String phoneNumber,
                           @RequestParam("role") String role
                           ) {
        String passcode = "";
        try {
            if ("add".equals(formType)) {
                Users newStudent = new Users();
                newStudent.setUsername(username);
                newStudent.setPassword(password);
                newStudent.setEmail(email);
                newStudent.setFullName(fullName);
                newStudent.setPhoneNumber(phoneNumber);
                newStudent.setRoles(role);
                if ("teacher".equalsIgnoreCase(role)) {
                    passcode = TEACHER_PASSCODE;
                }
                usersService.addUser(newStudent, passcode);
            }
            if ("edit".equals(formType)) {
                usersService.editUser(userId, fullName, username, email, phoneNumber, password, role);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return "redirect:/setting";

    }

    @PostMapping("/deleteUser")
    public String deleteUser(@AuthenticationPrincipal UserPrincipal user, @RequestParam("userId") int userId) {
        if (user.getUserRole().equalsIgnoreCase("teacher")) {
            userRepository.deleteById(userId);
        } else {
            throw new RuntimeException("User is not teacher");
        }
        return "redirect:/setting";
    }
}
