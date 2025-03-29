package com.comp3820sef.webapp.service;

import com.comp3820sef.webapp.entity.PollOptions;
import com.comp3820sef.webapp.entity.Polls;
import com.comp3820sef.webapp.entity.Users;
import com.comp3820sef.webapp.entity.Vote;
import com.comp3820sef.webapp.repository.PollOptionRepository;
import com.comp3820sef.webapp.repository.PollsRepository;
import com.comp3820sef.webapp.repository.UserRepository;
import com.comp3820sef.webapp.repository.VoteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class VoteService {

    @Autowired
    private VoteRepository voteRepository;

    @Autowired
    private PollOptionRepository pollOptionRepository;

    @Autowired
    private PollsRepository pollsRepository;

    @Autowired
    private UserRepository userRepository;

    public void submitVote(int pollId, int userId, int optionId) {
        // Check if the user has already voted in this poll
        Optional<Vote> existingVote = voteRepository.findByPollsPollIdAndUserUserId(pollId, userId);

        if (existingVote.isPresent()) {
            // User has already voted: update their vote
            Vote vote = existingVote.get();

            // Decrease vote count for the previously selected option
            PollOptions oldOption = vote.getOption();
            oldOption.setVoteCount(oldOption.getVoteCount() - 1);
            pollOptionRepository.save(oldOption);

            // Update vote to new option
            PollOptions newOption = pollOptionRepository.findById(optionId)
                    .orElseThrow(() -> new IllegalArgumentException("Option not found"));
            vote.setOption(newOption);
            voteRepository.save(vote);

            // Increase vote count for the newly selected option
            newOption.setVoteCount(newOption.getVoteCount() + 1);
            pollOptionRepository.save(newOption);

        } else {
            // create a new vote
            Vote vote = new Vote();

            Polls pollsEntity = pollsRepository.findById(pollId)
                    .orElseThrow(() -> new IllegalArgumentException("Poll not found"));
            Users userEntity = userRepository.findById(userId)
                    .orElseThrow(() -> new IllegalArgumentException("User not found"));
            PollOptions optionEntity = pollOptionRepository.findById(optionId)
                    .orElseThrow(() -> new IllegalArgumentException("Option not found"));

            // Set relationships
            vote.setPolls(pollsEntity);
            vote.setUser(userEntity);
            vote.setOption(optionEntity);
            voteRepository.save(vote);

            // Increase vote count for the selected option
            optionEntity.setVoteCount(optionEntity.getVoteCount() + 1);
            pollOptionRepository.save(optionEntity);
        }
    }
}
