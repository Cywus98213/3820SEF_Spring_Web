package com.comp3820sef.webapp.controller;

import com.comp3820sef.webapp.entity.LectureComments;
import com.comp3820sef.webapp.entity.LectureNotes;
import com.comp3820sef.webapp.entity.Lectures;
import com.comp3820sef.webapp.repository.LectureCommentsRepository;
import com.comp3820sef.webapp.repository.LectureNotesRepository;
import com.comp3820sef.webapp.service.LecturesService;
import org.springframework.beans.factory.annotation.Autowired;
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
    private LectureNotesRepository lectureNotesRepository;
    @Autowired
    private LectureCommentsRepository lectureCommentsRepository;


    @GetMapping("/lecture/{lectureId}")
    public String lecture(@PathVariable int lectureId, Model model) {
        Lectures Lecture = lecturesService.getLectureById(lectureId);
        List<LectureNotes> LectureNotes = lectureNotesRepository.findByLectureLectureId(lectureId);
        List<LectureComments> LectureComments = lectureCommentsRepository.findByLectureLectureId(lectureId);
        model.addAttribute("lectureNotes", LectureNotes);
        model.addAttribute("lectureComments", LectureComments);
        model.addAttribute("lecture", Lecture);
        return "lecture";
    }

}