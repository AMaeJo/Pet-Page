package com.codingdojo.java.petpages.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.codingdojo.java.petpages.models.Pet;


public interface PetRepository extends CrudRepository<Pet, Long>{
		
	List<Pet> findAll();

}
