package com.jiuyv.yl.console.security.entity;

import org.springframework.security.GrantedAuthority;

// TODO: Auto-generated Javadoc
/**
 * The Class AuthorityVo.
 */
public class Authority implements GrantedAuthority {
    
    /** The role. */
    private String role;
    
    /**
     * Gets the authority.
     * 
     * @return 权限
     */
    public String getAuthority() {
        return role;
    }
    
    /**
     * Gets the role.
     * 
     * @return the role
     */
    public String getRole() {
        return role;
    }

    /**
     * Sets the role.
     * 
     * @param role the new role
     */
    public void setRole(String role) {
        this.role = role;
    }

    /**
     * compare to Object.
     * 
     * @param o object
     * 
     * @return compareto
     */
    public int compareTo(Object o) {
        if (o != null && o instanceof GrantedAuthority) {
            String rhsRole = ((GrantedAuthority) o).getAuthority();
            
            if (rhsRole == null) {
                return -1;
            }
            
            return role.compareTo(rhsRole);
        }
        return -1;
    }

	/**
	 * Instantiates a new authority vo.
	 */
	public Authority() {
	}

	/**
	 * Instantiates a new authority vo.
	 * 
	 * @param role the role
	 */
	public Authority(String role) {
		this.role = role;
	}

	/**
	 * 获得散列码
	 * @return 散列码
	 */
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((role == null) ? 0 : role.hashCode());
		return result;
	}

	/**
	 * 判断本对象和传入对象是否相等
	 * @param obj 对象
	 * @return 判断对象是否相等
	 */
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (obj == null) {
			return false;
		}
		if (getClass() != obj.getClass()) {
			return false;
		}
		final Authority other = (Authority) obj;
		if (role == null) {
			if (other.role != null) {
				return false;
			}
		} else if (!role.equals(other.role)) {
			return false;
		}
		return true;
	}
}
