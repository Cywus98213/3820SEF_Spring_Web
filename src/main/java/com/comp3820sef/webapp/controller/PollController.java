package com.comp3820sef.webapp.controller;

import com.comp3820sef.webapp.entity.UserPrincipal;
import com.comp3820sef.webapp.repository.VoteRepository;
import com.comp3820sef.webapp.service.VoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class PollController {

    @Autowired
    private VoteService voteService;

    @Autowired
    private VoteRepository voteRepository;

    @PostMapping("poll/{pollId}/vote")
    public String vote(
            @PathVariable int pollId,
            @RequestParam int optionId,
            @AuthenticationPrincipal UserPrincipal user) {
        int userId = user.getUserId();

        voteService.submitVote(pollId, userId, optionId);
        return "redirect:/vote-success";
    }

    @GetMapping("/vote-success")
    public String voteSuccess() {
        return "voteSuccess";
    }


}
