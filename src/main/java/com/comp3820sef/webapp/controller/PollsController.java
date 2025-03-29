package com.comp3820sef.webapp.controller;

import com.comp3820sef.webapp.entity.Polls;
import com.comp3820sef.webapp.entity.UserPrincipal;
import com.comp3820sef.webapp.entity.Vote;
import com.comp3820sef.webapp.repository.PollsRepository;
import com.comp3820sef.webapp.repository.VoteRepository;
import com.comp3820sef.webapp.service.PollOptionsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.Optional;

@Controller
public class PollsController {

    @Autowired
    private PollsRepository pollRepository;

    @Autowired
    private PollOptionsService pollOptionsService;

    @Autowired
    private VoteRepository voteRepository;



    @GetMapping("/poll/{pollId}")
    public String getPoll(
            @PathVariable int pollId,
            Model model,
            @AuthenticationPrincipal UserPrincipal user) {
        int userId = user.getUserId();

        Polls poll = pollRepository.findById(pollId)
                .orElseThrow(() -> new IllegalArgumentException("Poll not found"));

        Optional<Vote> userVote = voteRepository.findByPollsPollIdAndUserUserId(pollId, userId);

        model.addAttribute("poll", poll);
        model.addAttribute("options", pollOptionsService.findByPollsPollId(pollId));
        model.addAttribute("userVote", userVote.orElse(null)); // Pass user's vote to view
        return "polls";
    }
}
