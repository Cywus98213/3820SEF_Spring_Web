package com.comp3820sef.webapp.controller;

import com.comp3820sef.webapp.entity.PollComments;
import com.comp3820sef.webapp.entity.Polls;
import com.comp3820sef.webapp.entity.UserPrincipal;
import com.comp3820sef.webapp.entity.Vote;
import com.comp3820sef.webapp.repository.PollsRepository;
import com.comp3820sef.webapp.repository.VoteRepository;
import com.comp3820sef.webapp.service.PollCommentService;
import com.comp3820sef.webapp.service.PollOptionsService;
import com.comp3820sef.webapp.service.PollsService;
import com.comp3820sef.webapp.service.VoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Optional;


@Controller
public class PollController {

    @Autowired
    private VoteService voteService;

    @Autowired
    private PollsService pollsService;

    @Autowired
    private PollOptionsService pollOptionsService;

    @Autowired
    private VoteRepository voteRepository;

    @Autowired
    private PollsRepository pollRepository;

    @Autowired
    private PollCommentService pollCommentService;

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

    @PostMapping("/deletePoll")
    public String deletePoll(@RequestParam("pollId") int pollId, @RequestParam String _method) {
        try {
            if ("DELETE".equalsIgnoreCase(_method)){
                pollsService.deletePollById(pollId);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/";
    }

    @PostMapping("/addPoll")
    public String addPoll(@RequestParam("option1") String option1,
                          @RequestParam("option2") String option2,
                          @RequestParam("option2") String option3,
                          @RequestParam("option2") String option4,
                          @RequestParam("pollTitle") String pollTitle) {

        Polls newPoll = pollsService.addPoll(pollTitle);


        int newPollId = newPoll.getPollId();
        pollOptionsService.addPollOptions(newPollId,option1,option2,option3,option4);

        return "redirect:/";
    }

    @GetMapping("/poll/{pollId}")
    public String getPoll(
            @PathVariable int pollId,
            Model model,
            @AuthenticationPrincipal UserPrincipal user) {
        int userId = user.getUserId();

        Polls poll = pollRepository.findById(pollId)
                .orElseThrow(() -> new IllegalArgumentException("Poll not found"));

        Optional<Vote> userVote = voteRepository.findByPollsPollIdAndUserUserId(pollId, userId);
        List<PollComments> pollComments = pollCommentService.findPollCommentsByPollId(pollId);

        model.addAttribute("pollId", pollId);
        model.addAttribute("poll", poll);
        model.addAttribute("pollComments", pollComments);
        model.addAttribute("options", pollOptionsService.findByPollsPollId(pollId));
        model.addAttribute("userVote", userVote.orElse(null));

        return "polls";
    }

    @PostMapping("/addPollComment")
    public String addPollComment(@RequestParam("pollId") int pollId, @RequestParam("commentText") String commentText, @AuthenticationPrincipal UserPrincipal user) {
        int userId = user.getUserId();
        pollCommentService.addPollComment(pollId, userId,commentText);
        return "redirect:/poll/" + pollId;
    }

}
