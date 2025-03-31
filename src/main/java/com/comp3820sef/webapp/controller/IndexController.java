package com.comp3820sef.webapp.controller;

import com.comp3820sef.webapp.entity.Lectures;
import com.comp3820sef.webapp.entity.Polls;
import com.comp3820sef.webapp.entity.UserPrincipal;
import com.comp3820sef.webapp.service.LecturesService;
import com.comp3820sef.webapp.service.PollsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class IndexController {

    @Autowired
    private PollsService pollsService;
    @Autowired
    private LecturesService lecturesService;


    @GetMapping("/")
    public String indexPage(Model model, @AuthenticationPrincipal UserPrincipal user) {
        if (user != null) {
            String role = user.getUserRole();
            model.addAttribute("role", role);
        }
        List<Polls> polls = pollsService.getAllPolls();
        List<Lectures> lectures = lecturesService.getAllLecture();
        model.addAttribute("polls", polls);
        model.addAttribute("lectures", lectures);
        return "index";
    }
}