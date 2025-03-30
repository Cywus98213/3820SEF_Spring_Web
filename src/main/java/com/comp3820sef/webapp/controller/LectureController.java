package com.comp3820sef.webapp.controller;

import com.comp3820sef.webapp.entity.*;
import com.comp3820sef.webapp.service.LectureCommentsService;
import com.comp3820sef.webapp.service.LectureNotesService;
import com.comp3820sef.webapp.service.LecturesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;


@Controller
public class LectureController {
    @Autowired
    private LecturesService lecturesService;
    @Autowired
    private LectureNotesService lectureNotesService;
    @Autowired
    private LectureCommentsService lectureCommentsService;


    @GetMapping("/lecture/{lectureId}")
    public String lecture(@PathVariable int lectureId, Model model, @AuthenticationPrincipal UserPrincipal user) {
        Lectures Lecture = lecturesService.getLectureById(lectureId);
        List<LectureNotes> LectureNotes = lectureNotesService.findByLectureId(lectureId);
        List<LectureComments> LectureComments = lectureCommentsService.findByLectureLectureId(lectureId);
        String role = user.getUserRole();
        int userId = user.getUserId();
        model.addAttribute("lectureNotes", LectureNotes);
        model.addAttribute("lectureComments", LectureComments);
        model.addAttribute("lecture", Lecture);
        model.addAttribute("role", role);
        model.addAttribute("userId", userId);
        return "lecture";
    }

}