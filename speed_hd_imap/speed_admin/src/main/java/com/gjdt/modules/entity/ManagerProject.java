package com.gjdt.modules.entity;

import lombok.Data;
//项目员工中间表
@Data
public class ManagerProject {
    private int id;  //主键id
    private int manager_id; //员工id
    private int project_id; //项目id
    private double ratio; //项目进度
    private String range; //项目范围
}
