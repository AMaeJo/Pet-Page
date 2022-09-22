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
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;



@Entity
@Table(name="users")
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@NotEmpty(message="User Name is required")
	@Size(min=3, max=255, message="Name must be at least between 3 and 255 characters")
	private String userName;
	
	
	@NotEmpty(message="Email is required")
	@Size(message="Please Enter A Valid Email")
	private String email;
	
	@NotEmpty(message="Password is required")
	@Size(min=8, max=128, message="Password must be at least between 8 and 128 characters")
	private String password; 
	
	@Transient
	@NotEmpty(message="Confirm Password is required")
	@Size(min=8, max=128, message="Password must be at least between 8 and 128 characters")
	private String confirmPassword;
	
	@Column(updatable = false)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createdAt;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updatedAt;
	
	// Whatever we named it inside of the attribute thats what we're going to map it tos
	@OneToMany(mappedBy="user", fetch = FetchType.LAZY)
	private List<Pet> pets;
	
	public List<Pet> getPets() {
		return getPets();
	}

	public void setPets(List<Pet> pets) {
		this.setPets(pets);
	}
	
	@ManyToMany
	@JoinTable(
			name="likes",
			joinColumns = @JoinColumn(name = "user_id"),
			inverseJoinColumns = @JoinColumn(name = "pet_id")
)
	
	private List<Pet> petsLiked;
	
	
	public List<Pet> getPetsLiked() {
		return petsLiked;
	}


	public void setPetsLiked(List<Pet> petsLiked) {
		this.petsLiked = petsLiked;
	}


	public User () {}

	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
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
}

