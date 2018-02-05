package com.books.library;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
public class Library 
{
	@Id @GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private String name;
	private String author_name;
	private int price;
	private String qty;
	
	@Transient
	private MultipartFile f;
	
	public MultipartFile getF() {
		return f;
	}

	public void setF(MultipartFile f) {
		this.f = f;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	private String imagePath;

	public int getId()
	{
		return id;
	}
	public void setId(int id) 
	{
		this.id = id;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public String getAuthor_name() 
	{
		return author_name;
	}
	public void setAuthor_name(String author_name) 
	{
		this.author_name = author_name;
	}
	public int getPrice() 
	{
		return price;
	}
	public void setPrice(int price)
	{
		this.price = price;
	}
	public String getQty()
	{
		return qty;
	}

	public void setQty(String qty) 
	{
		this.qty = qty;
	}

	public Library()
	{
		super();
	}
	
	
}
