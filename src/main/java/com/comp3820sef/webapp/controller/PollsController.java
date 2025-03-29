package com.comp3820sef.webapp.controller;

import com.comp3820sef.webapp.entity.PollOptions;
import com.comp3820sef.webapp.entity.Polls;
import com.comp3820sef.webapp.service.PollOptionsService;
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
    private PollOptionsService pollOptionsService;



    @GetMapping("/poll/{pollId}")
    public String poll(@PathVariable int pollId, Model model) {
        Polls poll = pollsService.getPollById(pollId);
        List<PollOptions> options = pollOptionsService.findByPollsPollId(pollId);
        model.addAttribute("poll", poll);
        model.addAttribute("options", options);
        return "polls";
    }
}
