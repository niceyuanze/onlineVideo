package com.onlineVideo.login.pojo;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by niceyuanze on 17-6-5.
 */
@Entity
@Table(name="user_role")
public class User_Role implements Serializable{

    @Id
    @ManyToOne
    @JoinColumn(name = "user$id",referencedColumnName = "id")

    private User user;

    @Id
    @ManyToOne
    @JoinColumn(name = "role$id",referencedColumnName = "id")
    private Role role;

    @Column(name = "state")
    private Integer state;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "User_Role{" +
                "user=" + user +
                ", role=" + role +
                ", state=" + state +
                '}';
    }
}
