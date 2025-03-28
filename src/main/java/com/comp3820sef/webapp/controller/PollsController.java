package com.comp3820sef.webapp.controller;

import com.comp3820sef.webapp.entity.Lectures;
import com.comp3820sef.webapp.entity.Polls;
import com.comp3820sef.webapp.service.LecturesService;
import com.comp3820sef.webapp.service.PollsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

@Controller
public class PollsController {

    @Autowired
    private PollsService pollsService;

    @Autowired
    private LecturesService lecturesService;


    @GetMapping("/course/{courseId}/lecture/{lectureId}/polls")
    public String coursePolls(Model model, @PathVariable int courseId, @PathVariable int lectureId) {
        List<Polls> Polls = pollsService.getPollsByLectureId(lectureId);
        Lectures Lecture = lecturesService.getLectureById(lectureId);
        model.addAttribute("polls", Polls);
        model.addAttribute("lecture", Lecture);
        return "polls";
    }
}
