package com.model;



import javax.persistence.*;


@Entity
@Table
public class User
{ 
	@Id
	String userName;	
	String Role,Enabled,userEmail,userPassword,userMoblie;
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getRole() {
		return Role;
	}
	public void setRole(String role) {
		Role = role;
	}
	public String getEnabled() {
		return Enabled;
	}
	public void setEnabled(String enabled) {
		Enabled = enabled;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserMoblie() {
		return userMoblie;
	}
	public void setUserMoblie(String userMoblie) {
		this.userMoblie = userMoblie;
	}

	
}
