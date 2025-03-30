package com.comp3820sef.webapp.controller;


import com.comp3820sef.webapp.entity.Users;
import com.comp3820sef.webapp.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class RegisterController {

    @Autowired
    private UsersService usersService;


    @GetMapping("/register")
    public String register() {
        return "register";
    }


    @PostMapping("/register")
    public String registerSubmit( Model model,
                                  @RequestParam("full_name") String fullName,
                                  @RequestParam("username") String userName,
                                  @RequestParam("email") String email,
                                  @RequestParam("password") String password,
                                  @RequestParam("phone_number") String phoneNumber,
                                  @RequestParam("roles") String roles,
                                  @RequestParam("passcode") String passcode
                                  ) {
        try {
              Users user = new Users();
              user.setUsername(userName);
              user.setPassword(password);
              user.setEmail(email);
              user.setFullName(fullName);
              user.setPhoneNumber(phoneNumber);
              user.setRoles(roles);
              usersService.addUser(user, passcode);
        } catch (Exception err) {
            err.printStackTrace();
            model.addAttribute("error", err.getMessage());
            return "redirect:/register";
        }
        model.addAttribute("success", "Create user successfully");
        return "login";
    }
}
