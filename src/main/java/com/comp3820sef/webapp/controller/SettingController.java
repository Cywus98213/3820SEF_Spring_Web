package com.comp3820sef.webapp.controller;

import com.comp3820sef.webapp.entity.*;
import com.comp3820sef.webapp.repository.UserRepository;
import com.comp3820sef.webapp.service.LectureCommentsService;
import com.comp3820sef.webapp.service.PollCommentService;
import com.comp3820sef.webapp.service.UsersService;
import com.comp3820sef.webapp.service.VoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class SettingController {

    @Value("${teacher.passcode}")
    private String TEACHER_PASSCODE;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private UsersService usersService;


    @Autowired
    private VoteService voteService;

    @Autowired
    private LectureCommentsService lectureCommentsService;

    @Autowired
    private PollCommentService pollCommentService;


    @GetMapping("/user/setting")
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

    @PostMapping("/user/userAction")
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

        return "redirect:/user/setting";

    }

    @PostMapping("/user/deleteUser")
    public String deleteUser(@AuthenticationPrincipal UserPrincipal user, @RequestParam("userId") int userId) {
        if (user.getUserRole().equalsIgnoreCase("teacher")) {
            userRepository.deleteById(userId);
        } else {
            throw new RuntimeException("User is not teacher");
        }
        return "redirect:/user/setting";
    }

    @GetMapping("/user/setting/{userId}/history")
    public String history(@PathVariable("userId") int userId, Model model) {
        List<Vote> votes = voteService.findVoteByUser_UserId(userId);
        List<LectureComments> lectureComments = lectureCommentsService.findLectureCommentByUser_UserId(userId);
        List<PollComments> pollComments = pollCommentService.findPollCommentByUser_UserId(userId);
        model.addAttribute("lectureComment", lectureComments);
        model.addAttribute("pollComment", pollComments);
        model.addAttribute("votes", votes);
        return "history";
    }
}
