package com.gjdt.modules.entity;

import lombok.Data;

import java.sql.Date;
import java.util.List;


//项目表
@Data
public class Project {
    private Integer id;                                     //项目id
    private String project_name;                            //项目名称
    private String project_number;                          //项目编号
    private Integer project_manager_id;                     //项目经理
    private Date contract_signing_time;                     //合同签订时间
    private Date contract_closing_time;                     //合同截止时间
    private String remaining_time;                          //剩余时间
    private double contract_amount;                         //合同金额
    private double effective_contract_amount;               //有效合同金额
    private String total_hours;                             //总工时
    private double project_schedule;                        //项目进度
    private String project_health_index;                    //项目健康指数
    private Date final_inspection_time;                     //终验时间
    private double project_budget;                          //项目预算
    private double project_residual_cost;                   //预算剩余成本
    private double project_payment;                         //项目回款
    private double project_cost;                            //项目成本
    private double labor_cost;                              //人力成本
    private double expense_cost;                            //费用成本
    private double estimated_labor_cost;                    //预估人力成本
    private double purchase_contract_amount;                //采购合同金额
    private double shared_expense;                          //公摊费用
    private String review_document_url;                     //评审文件路径
    private String technical_design_book_url;               //技术设计书文件路径
    private String technical_summary_url;                   //技术总结文件路径
    private String project_quality_inspection_report_url;   //项目质检报告文件路径
    private String acceptance_report;                       //验收报告路径
    private List<Manager> managers;
}
