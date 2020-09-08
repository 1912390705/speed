package com.gjdt.modules.entity;

import lombok.Data;

@Data
public class Role {
    private Integer id;   //角色id
    private String role_Name;  //角色名称
    private int role_type;     //角色属性
}
