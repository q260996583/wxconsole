package com.jiuyv.yl.console.security.entity;

import org.springframework.security.GrantedAuthority;
import org.springframework.security.userdetails.UserDetails;

public class SecurityUserDetail  extends User implements UserDetails {

	private GrantedAuthority[] authorities;
	public GrantedAuthority[] getAuthorities() {
		// TODO Auto-generated method stub
		return this.authorities;
	}

	public String getPassword() {
		// TODO Auto-generated method stub
		return super.getPassword();
	}

	public String getUsername() {
		// TODO Auto-generated method stub
		return this.getOpName();
	}

	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		/*if (this.status.equals("1")){
			return false;
		}*/
		return true;
	}

	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	public boolean isEnabled() {
		/*if (this.status.equals("0")){
			return true;
		}
		return false;*/
		return true;
	}
	public void setAuthorities(GrantedAuthority[] authorities) {
	       
	        this.authorities = authorities;
	    }
}
