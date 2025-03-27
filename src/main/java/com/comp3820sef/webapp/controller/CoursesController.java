package com.comp3820sef.webapp.controller;

import com.comp3820sef.webapp.entity.Courses;
import com.comp3820sef.webapp.service.CoursesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.ui.Model;

import java.util.List;

@Controller
public class CoursesController {
    @Autowired
    private CoursesService coursesService;

    @GetMapping("/course")
    public String course(Model model) {
        return "course";
    }
}