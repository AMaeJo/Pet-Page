package com.codingdojo.java.petpages.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.java.petpages.models.Pet;
import com.codingdojo.java.petpages.models.User;
import com.codingdojo.java.petpages.repositories.PetRepository;


@Service
public class PetService {
	
	@Autowired
	private PetRepository petRepository;

	
	public Pet createPet(Pet newPet) {
		return petRepository.save(newPet);
		
	}
	
	public List<Pet> getAllPets() {
		return (List<Pet>) petRepository.findAll();
	}
	
	public Pet getById(Long id) {
		return petRepository.findById(id).orElse(null);
	}
	
	public Pet updatePet (Pet editPet) {
		return petRepository.save(editPet);
	}
	
	public void deleteById(Long id) {
		petRepository.deleteById(id);
	}
	
	// like
	public void likePet(Pet pet, User user) {
		List<User> likers = pet.getLikers();
		likers.add(user);
		petRepository.save(pet);
	}
	
	// unlike
	public void unlikePet() {
		
	}

}
