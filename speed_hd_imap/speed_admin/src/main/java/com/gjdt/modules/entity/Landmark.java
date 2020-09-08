package com.gjdt.modules.entity;

import lombok.Data;

import java.sql.Timestamp;

//里程碑表
@Data
public class Landmark {
    private Integer id;  //主键id
    private int project_id; //项目id
    private String title;   //标题
    private int iscompleted; //是否完成
    private String description;  //描述
    private Timestamp complete_time; //完成时间
    private Timestamp add_time; //添加时间
    private String filename; //上传的文件地址
    private double ratio; //进度
    private Project project;
}
