package com.comp3820sef.webapp.service;

import com.comp3820sef.webapp.entity.PollOptions;
import com.comp3820sef.webapp.entity.Polls;
import com.comp3820sef.webapp.repository.PollOptionRepository;
import com.comp3820sef.webapp.repository.PollsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PollOptionsService {

    @Autowired
    private PollOptionRepository pollOptionRepository;
    @Autowired
    private PollsRepository pollsRepository;

    public List<PollOptions> findPollOptionsByPolls_PollId(int pollId) {
        return pollOptionRepository.findPollOptionsByPolls_PollId(pollId);
    }

    public void addPollOptions(int newPollId,String... options) {
        Polls poll = pollsRepository.findById(newPollId)
                .orElseThrow(() -> new IllegalArgumentException("Invalid poll ID"));

        for (String option : options){
            PollOptions pollOptions = new PollOptions();
            pollOptions.setPolls(poll);
            pollOptions.setOptionText(option);
            pollOptionRepository.save(pollOptions);
        }
    }
}
