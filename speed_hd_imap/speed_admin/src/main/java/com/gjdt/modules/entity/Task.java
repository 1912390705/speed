package com.gjdt.modules.entity;

import lombok.Data;

import java.sql.Timestamp;

/*
* 任务记录表
* */
@Data
public class Task {
    private Integer id;  //主键id
    private int projectManager;  //任务负责人的id
    private int staffName;      //执行任务的id
    private Timestamp addTime;  //任务创建的时间
    private Timestamp endTime;  //任务完成的时间
    private String taskScope;    //任务所属的区域
    private String taskContent;  //任务的内容
    private int isExamine;       //任务执行者是否查看了任务
    private int project_id;      //任务所属项目的id
    private double ratio;        //该任务的进度
    private Manager manager;
    private Manager staff;
}
