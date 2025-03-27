package com.comp3820sef.webapp.controller;

import com.comp3820sef.webapp.service.LecturesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.ui.Model;
import com.comp3820sef.webapp.entity.Lectures;

import java.util.List;


@Controller
@RequestMapping("/lectures")
public class LecturesController {
    @Autowired
    private LecturesService lecturesService;

    @GetMapping("/{courseId}")
    public String getLecturesByCourseId(@PathVariable int courseId, Model model) {
        List<Lectures> lectures = lecturesService.getLecturesByCourseId(courseId);
        model.addAttribute("lectures", lectures);
        return "lectures";
    }
}