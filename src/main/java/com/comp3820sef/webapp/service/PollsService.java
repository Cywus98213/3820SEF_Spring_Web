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

    //for lecture poll fetch
    public List<Polls> getPollsByLectureId(int lectureId) {
        return pollsRepository.findPollsByLectureLectureId(lectureId);
    }
}
