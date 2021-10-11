package com.laptrinhjavaweb.dto;

public class UserDTO extends AbstractDTO {

	private String username;
	private String password;
	private String name;
	private String email;
	private String phone;
	private String address;
	private String emoij;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmoij() {
		return emoij;
	}
	public void setEmoij(String emoij) {
		this.emoij = emoij;
	}
	
}
