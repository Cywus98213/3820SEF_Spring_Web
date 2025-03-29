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

    public Polls getPollById(int pollId) {
        return pollsRepository.findById(pollId).orElse(null);
    }

}
