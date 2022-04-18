package com.daniel.books.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;

//import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.DeleteMapping;
//import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daniel.books.models.User;
import com.daniel.books.models.LoginUser;
import com.daniel.books.services.UserService;

@Controller
public class HomeController {
    
     @Autowired
     private UserService userServ;
    
    @GetMapping("/")
    public String index(Model model) {
    
        // Bind empty User and LoginUser objects to the JSP
        // to capture the form input
        model.addAttribute("newUser", new User());
        model.addAttribute("newLogin", new LoginUser());
        return "log.jsp";
    }
    
    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser, 
            BindingResult result, Model model, HttpSession session) {
        
    	userServ.register(newUser, result);
        
        if(result.hasErrors()) {
            // check validation
            model.addAttribute("newLogin", new LoginUser());
            return "log.jsp";
        }
        
        // No errors!  Store Id in session
        session.setAttribute("userId", newUser.getId()); 
        session.setAttribute("userName", newUser.getUserName());
        return "redirect:/books";
    }
    
    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
            BindingResult result, Model model, HttpSession session) {
        
        // Add once service is implemented:
         User user = userServ.login(newLogin, result);
//    
        if(result.hasErrors()) {
            model.addAttribute("newUser", new User());
            return "log.jsp";
        }

//        // No errors! 
        session.setAttribute("userId", user.getId());
        session.setAttribute("userName", user.getUserName());
    
        return "redirect:/books";
    }
   
    
    @GetMapping("/logout") 
    	public String logout(HttpSession session) {
    		session.invalidate();
    		 return "redirect:/";
    	
    }
}
