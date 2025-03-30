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


    @PostMapping("/addcomment")
    public String addComment(@RequestParam("lectureId") int lectureId, @RequestParam("commentText") String commentText, @AuthenticationPrincipal UserPrincipal user) {
        int userId = user.getUserId();
        lectureCommentsService.addComment(commentText,lectureId, userId);
        return "redirect:/lecture/" + lectureId;
    }



    @PostMapping("/updateComment")
    public String updateComment(@RequestParam String _method,@RequestParam("lectureId") int lectureId,@RequestParam("lectureCommentId") int commentId, @RequestParam("updatedText") String updatedText, @AuthenticationPrincipal UserPrincipal user) {
        if ("PUT".equalsIgnoreCase(_method)){
            int userId = user.getUserId();
            lectureCommentsService.updateComment(updatedText,lectureId, commentId, userId);
        }
        return "redirect:/lecture/" + lectureId;
    }

}
