package com.comp3820sef.webapp.controller;

import com.comp3820sef.webapp.entity.LectureComments;
import com.comp3820sef.webapp.entity.LectureNotes;
import com.comp3820sef.webapp.entity.Lectures;
import com.comp3820sef.webapp.entity.UserPrincipal;
import com.comp3820sef.webapp.service.LectureCommentsService;
import com.comp3820sef.webapp.service.LectureNotesService;
import com.comp3820sef.webapp.service.LecturesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;


@Controller
public class LectureController {
    @Autowired
    private LecturesService lecturesService;
    @Autowired
    private LectureNotesService lectureNotesService;
    @Autowired
    private LectureCommentsService lectureCommentsService;


    @GetMapping("/lecture/{lectureId}")
    public String lecture(@PathVariable int lectureId, Model model, @AuthenticationPrincipal UserPrincipal user) {
        Lectures Lecture = lecturesService.getLectureById(lectureId);
        List<LectureNotes> LectureNotes = lectureNotesService.findByLectureId(lectureId);
        List<LectureComments> LectureComments = lectureCommentsService.findByLectureLectureId(lectureId);
        String role = user.getUserRole();
        int userId = user.getUserId();
        model.addAttribute("lectureNotes", LectureNotes);
        model.addAttribute("lectureComments", LectureComments);
        model.addAttribute("lecture", Lecture);
        model.addAttribute("role", role);
        model.addAttribute("userId", userId);
        return "lecture";
    }

    @PostMapping("/lecture/deleteLecture")
    public String deleteLecture(@RequestParam("lectureId") int lectureId, @RequestParam String _method) {
        try {
            if ("DELETE".equalsIgnoreCase(_method)){
                lecturesService.deleteLectureById(lectureId);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/";
    }

    @PostMapping("/lecture/addLecture")
    public String addLecture(@RequestParam("lectureTitle") String lectureTitle){

        try {
            lecturesService.addLecture(lectureTitle);
        } catch (Exception e){
            e.printStackTrace();
        }
        return "redirect:/";
    }

    @PostMapping("/lecture/uploadFile")
    public String uploadFile(@RequestParam("lectureFile") MultipartFile file,@RequestParam("lectureId") int lectureId){
        String fileName = file.getOriginalFilename();

        lectureNotesService.uploadFile(fileName, lectureId);

        return "redirect:/lecture/" + lectureId;
    }

    @PostMapping("/lecture/deleteNote")
    public String deleteNote(@RequestParam("noteId") int noteId,
                             @RequestParam("lectureId") int lectureId,
                             @RequestParam String _method){

        if ("DELETE".equalsIgnoreCase(_method)){
            lectureNotesService.deleteNoteById(noteId);
        }
        return "redirect:/lecture/" + lectureId;
    }

}