package com.example.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity(name="user")
public class User implements Serializable{
	
	@Id
	private String id;
	private String password;
	
	public User(){}
	public User(String id, String password) {
		super();
		this.id = id;
		this.password = password;
	}
	
	@Override
	public String toString() {
		return "User [id=" + id + ", password=" + password + "]";
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
