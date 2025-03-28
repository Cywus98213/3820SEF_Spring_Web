package com.comp3820sef.webapp.controller;

import com.comp3820sef.webapp.entity.Courses;
import com.comp3820sef.webapp.entity.Lectures;
import com.comp3820sef.webapp.service.CoursesService;
import com.comp3820sef.webapp.service.LecturesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

@Controller

public class CoursesController {

    @Autowired
    private CoursesService coursesService;
    @Autowired
    private LecturesService lecturesService;

    @GetMapping("/course/{courseId}")
    public String course(@PathVariable int courseId, Model model) {
        List<Lectures> lectures = lecturesService.getLecturesByCourseId(courseId);
        Courses course = coursesService.getCourseById(courseId);
        model.addAttribute("course", course);
        model.addAttribute("lectures", lectures);
        return "course";
    }
}