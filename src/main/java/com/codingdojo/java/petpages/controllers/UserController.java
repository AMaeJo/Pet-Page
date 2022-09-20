package com.codingdojo.java.petpages.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.codingdojo.java.petpages.models.LoginUser;
import com.codingdojo.java.petpages.models.User;
import com.codingdojo.java.petpages.services.PetService;
import com.codingdojo.java.petpages.services.UserService;

@Controller
public class UserController {
		
	@Autowired
	private UserService userService;
	@Autowired
	private PetService petService;
		
	@GetMapping("/")
	public String index(Model model) {
		model.addAttribute("newUser", new User());
		model.addAttribute("newLoginUser", new LoginUser());
			return "index.jsp";
		 }
		 
		 
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("newUser") User newUser, 
			BindingResult result, Model model, HttpSession session) {
			User user = userService.register(newUser, result);
		     
		    if(result.hasErrors()) {
		    	model.addAttribute("newLoginUser", new LoginUser());
		        return "index.jsp";
		    }
		     session.setAttribute("userId", user.getId());
		     return "redirect:/home";
	}

	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLoginUser") LoginUser newLoginUser, 
			BindingResult result, Model model, HttpSession session) {
			User user = userService.login(newLoginUser, result);
		 	
		    if(result.hasErrors()) {
		    	model.addAttribute("newUser", new User());
		        return "index.jsp";
		    }
		    session.setAttribute("userId", user.getId());
		    return "redirect:/home";
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();

		return "redirect:/";
	}
		 
		 
	@GetMapping("/home")
	public String home(Model model, HttpSession session) {
		if (session.getAttribute("userId") ==null) {
			return "redirect:/";
		}
		model.addAttribute("user", userService.getById((Long)session.getAttribute("userId")));
		model.addAttribute("allPets", petService.getAllPets());
		return "home.jsp";
		}


}
