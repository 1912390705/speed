package com.gjdt.modules.entity;

import lombok.Data;

//成员表
@Data
public class Manager {
    private Integer id;  //主键id
    private String user_Name; //账户
    private String password;  //密码
    private int role_id;      //角色id
    private String telephone; //电话
    private String real_name; //真实姓名
    private String sex;       //性别
    private String department;//部门
    private String position;  //岗位
    private int status;       //是否启用
    private Role role;
}

