package com.codingdojo.java.petpages;

import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

import src.main.java.com.codingdojo.java.petpages.PetPagesApplication;

public class ServletInitializer extends SpringBootServletInitializer {
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(PetPagesApplication.class);
	
	}
}
