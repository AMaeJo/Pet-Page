package com.codingdojo.java.petpages.repositories;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.java.petpages.models.User;


@Repository
public interface UserRepository extends CrudRepository<User, Long>{
	
	Optional<User> findByUserName(String username);
	
	Optional<User> findById(Long id);
	
}
