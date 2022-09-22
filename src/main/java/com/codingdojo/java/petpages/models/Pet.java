package com.codingdojo.java.petpages.models;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="pets")
public class Pet {
		
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotEmpty(message="Name is required")
	@Size(min=3, max=55, message="Name must be at least between 3 and 55 characters")
	private String name;
	
	@NotNull(message="Species is required")
	@Size(min=6, max=30, message="Species has to be between 6 and 30 characters")
		private String species;
	
	@NotNull(message="Gender is required")
	@Size(min=1, max=6, message="Gender has to be between 1 and 6 characters")
	private String gender;
		
	@Min(value = 0, message="Age cannot be less than 0 .")
	@Max(value = 30, message="Age cannot exceed 30.")
	private int age;
		
	@NotNull(message="Favorite Treat is required")
	@Size(min=3, max=55, message="Favorite treat must be between 3 and 55 characters")
	private String favoriteTreat;
	
	@NotNull(message="Introduction is required")
	@Size(min=5, max=255, message="Favorite treat must be between 5 and 255 characters")
	private String introduction;
		
	
	@Column(updatable = false)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createdAt;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updatedAt;
		
	//Many To One
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="user_id")
	private User user;
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
		
	@ManyToMany
	@JoinTable(
			name="likes",
			joinColumns = @JoinColumn(name = "pet_id"),
			inverseJoinColumns = @JoinColumn(name = "user_id")
)
	
	private List<User> likers;
	
	public List<User> getLikers() {
		return likers;
	}

	public void setLikers(List<User> likers) {
		this.likers = likers;
	}
		
		
	public Pet() {}
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
		
	public String getSpecies() {
		return species;
	}
	
	public void setSpecies(String species) {
		this.species = species;
	}
	
	public String getGender() {
		return gender;
	}
	
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	public int getAge() {
		return age;
	}
	
	public void setAge(int age) {
		this.age = age;
	}
	
	public String getFavoriteTreat() {
		return favoriteTreat;
	}
	
	public void setFavoriteTreat(String favoriteTreat) {
		this.favoriteTreat = favoriteTreat;
	}
	
	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public Date getCreatedAt() {
		return createdAt;
	}
	
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	
	public Date getUpdatedAt() {
		return updatedAt;
	}
	
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	
	@PrePersist
	protected void onCreate() {
		this.createdAt = new Date();
	}
		
	@PreUpdate
	protected void onUpdate() {
		this.updatedAt = new Date();
	}
	
	// this is a comment
		   

}
