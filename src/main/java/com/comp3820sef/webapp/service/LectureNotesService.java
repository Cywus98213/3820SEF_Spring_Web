package com.comp3820sef.webapp.service;

import com.comp3820sef.webapp.entity.LectureNotes;
import com.comp3820sef.webapp.entity.Lectures;
import com.comp3820sef.webapp.repository.LectureNotesRepository;
import com.comp3820sef.webapp.repository.LecturesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LectureNotesService {

    @Autowired
    private LectureNotesRepository lectureNotesRepository;

    @Autowired
    private LecturesRepository lecuresRepository;

    public List<LectureNotes> findByLectureId(int lectureId) {
        return lectureNotesRepository.findByLectureLectureId(lectureId);
    }

    public void uploadFile(String fileName, int lectureId) {

        Lectures lecture = lecuresRepository.findById(lectureId)
                .orElseThrow(() -> new IllegalArgumentException("Invalid lecture ID"));

        LectureNotes note = new LectureNotes();
        note.setLecture(lecture);
        note.setLectureNoteTitle(fileName);
        note.setLectureNoteLink(fileName);
        lectureNotesRepository.save(note);
    }

    public void deleteNoteById(int noteId) {
        lectureNotesRepository.deleteById(noteId);
    }
}
