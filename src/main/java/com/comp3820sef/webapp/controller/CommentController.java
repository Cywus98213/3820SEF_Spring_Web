package com.comp3820sef.webapp.controller;

import com.comp3820sef.webapp.entity.UserPrincipal;
import com.comp3820sef.webapp.service.LectureCommentsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CommentController {

    @Autowired
    private LectureCommentsService lectureCommentsService;


    @PostMapping("/lecture/addcomment")
    public String addComment(@RequestParam("lectureId") int lectureId, @RequestParam("commentText") String commentText, @AuthenticationPrincipal UserPrincipal user) {
        int userId = user.getUserId();
        lectureCommentsService.addComment(commentText,lectureId, userId);
        return "redirect:/lecture/" + lectureId;
    }


    @PostMapping("/lecture/deleteComment")
    public String deleteComment(@RequestParam String _method,
                                @RequestParam("lectureId") int lectureId,
                                @RequestParam("commentId") int commentId
                                ){

        if ("DELETE".equalsIgnoreCase(_method)){
            lectureCommentsService.deleteById(commentId);
        }

        return "redirect:/lecture/" + lectureId;
    }

}
