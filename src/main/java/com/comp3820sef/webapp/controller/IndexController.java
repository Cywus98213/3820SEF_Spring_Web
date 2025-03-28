package com.comp3820sef.webapp.controller;

import com.comp3820sef.webapp.entity.Courses;
import com.comp3820sef.webapp.entity.Polls;
import com.comp3820sef.webapp.service.CoursesService;
import com.comp3820sef.webapp.service.PollsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class IndexController {

    @Autowired
    private CoursesService coursesService;
    @Autowired
    private PollsService pollsService;

    @GetMapping("/")
    public String showCourses(Model model) {
        List<Courses> courses = coursesService.getAllCourses();
        List<Polls> polls = pollsService.getAllPolls();
        model.addAttribute("courses", courses);
        model.addAttribute("polls", polls);
        return "index";
    }
}