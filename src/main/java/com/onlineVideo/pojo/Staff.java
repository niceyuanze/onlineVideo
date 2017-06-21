package com.onlineVideo.pojo;

import javax.persistence.*;

/**
 * Created by niceyuanze on 17-6-7.
 */
@Entity
@Table(name = "staff")
public class Staff {
    @Id
    private String staffCode;

    @Column(name = "password", nullable = false,updatable = false,unique = true)
    @Basic
    private String password;

    @Column(name = "name", nullable = false,updatable = false,unique = true)
    @Basic
    private String name;

    @ManyToOne
    @JoinColumn(name = "role$id",referencedColumnName = "id")
    private Role role;

    public String getStaffCode() {
        return staffCode;
    }

    public void setStaffCode(String staffCode) {
        this.staffCode = staffCode;
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

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "Staff{" +
                "staffCode='" + staffCode + '\'' +
                ", password='" + password + '\'' +
                ", name='" + name + '\'' +
                ", role=" + role +
                '}';
    }
}
