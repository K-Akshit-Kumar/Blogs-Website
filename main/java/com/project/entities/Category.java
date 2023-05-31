package com.project.entities;

public class Category {
	private int cid;
	private String name;
	private String description;
	
	//Constructors
	public Category(int cid, String name, String description) {
		this.cid = cid;
		this.name = name;
		this.description = description;
	}
	public Category() {
		
	}
	public Category(String name, String description) {
		this.name = name;
		this.description = description;
	}
	
	//Getters and Setters
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}	
}
