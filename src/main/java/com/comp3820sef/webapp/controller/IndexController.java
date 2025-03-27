package com.comp3820sef.webapp.controller;

import com.comp3820sef.webapp.entity.Courses;
import com.comp3820sef.webapp.service.CoursesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class IndexController {

    @Autowired
    private CoursesService coursesService;

    @GetMapping("/")
    public String showCourses(Model model) {
        List<Courses> courses = coursesService.getAllCourses();
        model.addAttribute("courses", courses);
        return "index";
    }
}