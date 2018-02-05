package com.books.signup;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
public class Signup 
{
	@Id @GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@NotNull (message="Name cannot be Null")	
	@NotEmpty (message="Name cannot be Empty")
	private String name;
	
	@Pattern (regexp="^[6-9]{1}[0-9]{9}$", message="Phone number format must be as that of an Indian mobile number")
	private String contact_number;
	
	@Pattern (regexp="^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+.['com','co.in','co']+$", message="Email is not in correct format(***@abc.com)")
	private String email;
	
	private String password;
	
	private String address;
	
	private String role="ROLE_USER";
	private boolean active = true;
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public boolean isActive() {
		return active;
	}
	public void setActive(boolean active) {
		this.active = active;
	}
	
	
	public String getName() 
	{
		return name;
	}
	public void setName(String name) 
	{
		this.name = name;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getContact_number() {
		return contact_number;
	}
	public void setContact_number(String contact_number) {
		this.contact_number = contact_number;
	}
	public String getEmail() 
	{
		return email;
	}
	public void setEmail(String email) 
	{
		this.email = email;
	}
	public String getPassword() 
	{
		return password;
	}
	public void setPassword(String password) 
	{
		this.password = password;
	}
	public String getAddress() 
	{
		return address;
	}
	public void setAddress(String address) 
	{
		this.address = address;
	}
	public Signup() 
	{
		super();
	}
}
