package com.comp3820sef.webapp.service;

import com.comp3820sef.webapp.entity.PollOptions;
import com.comp3820sef.webapp.repository.PollOptionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PollOptionsService {

    @Autowired
    private PollOptionRepository pollOptionRepository;

    public List<PollOptions> findByPollsPollId(int pollId) {
        return pollOptionRepository.findByPollsPollId(pollId);
    }

}
