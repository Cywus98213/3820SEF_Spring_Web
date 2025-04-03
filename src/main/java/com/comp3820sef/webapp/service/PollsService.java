package com.comp3820sef.webapp.service;

import com.comp3820sef.webapp.entity.Polls;
import com.comp3820sef.webapp.repository.PollsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PollsService {

    @Autowired
    private PollsRepository pollsRepository;

    // for index page fetch
    public List<Polls> getAllPolls() {
        return pollsRepository.findAll();
    }

    public void deletePollById (int pollId) {
        try {
            pollsRepository.deleteById(pollId);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Polls addPoll(String pollTitle) {
        Polls polls = new Polls();
        polls.setPollQuestion(pollTitle);
        return pollsRepository.save(polls);
    }

}
