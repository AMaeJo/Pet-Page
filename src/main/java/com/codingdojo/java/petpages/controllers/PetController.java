package com.codingdojo.java.petpages.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.codingdojo.java.petpages.models.Pet;
import com.codingdojo.java.petpages.models.User;
import com.codingdojo.java.petpages.services.PetService;
import com.codingdojo.java.petpages.services.UserService;

@Controller
@RequestMapping("/pet")
public class PetController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private PetService petService;
	
	 @GetMapping("/new")
	 public String newPet(@ModelAttribute("newPet") Profile newPet, HttpSession session, Model model) {
		 if (session.getAttribute("userId")==null) {
			 return "redirect:/";
		}
		 model.addAttribute("user", userService.getById((Long)session.getAttribute("userId")));
		 return "newPet.jsp";
	 	}	
	 
		@PostMapping("/create")
		public String createPet(@Valid @ModelAttribute("newPet") Pet newPet, BindingResult result) {
			if(result.hasErrors()) {
				return "newPet.jsp";
			}
			petService.createPet(newPet);
			return "redirect:/home";
		}
		
		@GetMapping("/{id}")
		public String viewPet(@PathVariable Long id, @ModelAttribute("viewPet")Pet viewPet, Model model, HttpSession session) {
			if (session.getAttribute("userId")==null) {
				return "redirect:/";
			}
			model.addAttribute("user", userService.getById((Long)session.getAttribute("userId")));
			model.addAttribute("pet", petService.getById(id));
			return "viewPet.jsp";
		}
		
		
		@GetMapping("/{id}/edit")
		public String editPet(@PathVariable Long id, @ModelAttribute("editPet") Pet editPet, Model model, HttpSession session) {
			if (session.getAttribute("userId")==null) {
				return "redirect:/";
			}
			model.addAttribute("user", userService.getById((Long)session.getAttribute("userId")));
			model.addAttribute("pet", petService.getById(id));
			return "editPet.jsp";
		}
		
		@PutMapping("/{id}/update")
		public String updatePet(@Valid @ModelAttribute("editPet") Pet editPet, BindingResult result, Model model) {	
			if(result.hasErrors()) {
				model.addAttribute(editPet);
				return "editPet.jsp";
			}
			petService.updatePet(editPet);
			return "redirect:/home";
		}

		@DeleteMapping("/{id}/delete")
		public String deletePet(@PathVariable Long id) {
			petService.deleteById(id);
			return "redirect:/home";
			
		}
		
		// like pet
		@GetMapping("/{id}/like")
		public String likeProject(@PathVariable Long id) {
			Pet pet = petService.getById(id);
			User user = (Long)session.getAttribute("userId");
			petService.likePet(pet, user);
			return "redirect:/home";
		}
		
}
