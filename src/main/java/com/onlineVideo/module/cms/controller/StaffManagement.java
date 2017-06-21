package com.onlineVideo.module.cms.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.onlineVideo.dao.RoleDao;
import com.onlineVideo.dao.StaffDao;
import com.onlineVideo.pojo.Role;
import com.onlineVideo.pojo.Staff;
import com.onlineVideo.web.base.Result;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by niceyuanze on 17-6-17.
 */
@RestController
@RequestMapping("/cms/staff")
@RequiresRoles("系统管理员")
public class StaffManagement {

    @Autowired
    private RoleDao roleDao;

    @Autowired
    private StaffDao staffDao;


    @ResponseBody
    @RequestMapping(value="/roles", method = RequestMethod.GET,produces = "text/json;charset=UTF-8")
    public String getRoles() throws JsonProcessingException {
        return Result.success("ok",roleDao.getAll());
    }

    @ResponseBody
    @RequestMapping(value="/add", method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
    public String add(Staff staff,String roleId) throws JsonProcessingException {
        System.out.println(roleId);
        Role role = new Role();
        role.setId(roleId);
        staff.setRole(role);
        System.out.println(staff);
        staffDao.save(staff);
        return Result.success("ok");
    }



}
