package com.onlineVideo.pojo;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by niceyuanze on 17-6-7.
 */
@Entity
@Table(name = "staff")
public class Staff {
    @Id
    private String id;

}
