package com.onlineVideo.pojo;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by niceyuanze on 17-6-3.
 */
@Entity
@Table(name="user")
public class User {


    //user表id属性为主键，并且采用uuid类型,uuid类型自动生成
    @Id
    @GeneratedValue(generator = "uuid") @GenericGenerator(name = "uuid", strategy = "uuid")
    private String id;




    @Column(name = "loginname", nullable = false,updatable = false,unique = true)
    @Basic
    private String loginname;





    @Column(name = "password", nullable = false,updatable = true,unique = false)
    @Basic
    private String password;

    @Column(name="name", nullable = false,updatable = true,unique = true)
    private String name;





    @Column(name = "email", nullable = false,updatable = true,unique = true)
    @Basic
    private String email;




//    @ManyToMany(cascade = CascadeType.REFRESH, fetch = FetchType.EAGER)
//    @JoinTable(name = "user_role",
//            joinColumns = { @JoinColumn(name = "user$id") },
//            inverseJoinColumns = { @JoinColumn(name = "role$id") })
//    private List<Role> roles = new ArrayList<>();





    public User() {
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }




    public String getLoginname() {
        return loginname;
    }

    public void setLoginname(String loginname) {
        this.loginname = loginname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "User{" +
                "id='" + id + '\'' +
                ", loginname='" + loginname + '\'' +
                ", password='" + password + '\'' +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                '}';
    }
}
