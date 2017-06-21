package com.onlineVideo.dao;

import com.onlineVideo.pojo.Staff;

/**
 * Created by niceyuanze on 17-6-17.
 */
public interface StaffDao {


    public void save(Staff staff);

    public Staff getStaffByLoginname(String username);

}
