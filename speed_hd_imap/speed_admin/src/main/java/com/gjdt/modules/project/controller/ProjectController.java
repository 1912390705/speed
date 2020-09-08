package com.gjdt.modules.project.controller;

import com.github.pagehelper.PageInfo;

import com.gjdt.modules.entity.Project;
import com.gjdt.modules.entity.Result;
import com.gjdt.modules.project.service.ProjectService;
import com.gjdt.modules.util.FileUtils;
import com.gjdt.modules.util.TokenUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequestMapping("/project")
public class ProjectController {
    @Autowired
    private ProjectService projectService;

    @RequestMapping("/selectAllProject")
    public PageInfo<Project> selectAllProject(@Value("${pageNum:1}") int pageNum,@Value("${pageSize:10}") int pageSize) {
        return projectService.selectAllProject(pageNum, pageSize, Integer.parseInt(TokenUtil.getTokenManagerId()));
    }

    @RequestMapping("/addProject")
    public Result addProject(Project project, @RequestParam("review_document_url") MultipartFile review_document_url, @RequestParam("technical_design_book_url") MultipartFile technical_design_book_url,
                             @RequestParam("technical_summary_url") MultipartFile technical_summary_url, @RequestParam("project_quality_inspection_report_url") MultipartFile project_quality_inspection_report_url,
                             @RequestParam("acceptance_report") MultipartFile acceptance_report) {
        if (review_document_url != null) {
            if (FileUtils.fileUpload(review_document_url)) {
                project.setReview_document_url(review_document_url.getOriginalFilename());
            }
        }
        if (technical_design_book_url != null) {
            if (FileUtils.fileUpload(technical_design_book_url)) {
                project.setTechnical_design_book_url(technical_design_book_url.getOriginalFilename());
            }
        }
        if (technical_summary_url != null) {
            if (FileUtils.fileUpload(technical_summary_url)) {
                project.setTechnical_summary_url(technical_summary_url.getOriginalFilename());
            }
        }
        if (project_quality_inspection_report_url != null) {
            if (FileUtils.fileUpload(project_quality_inspection_report_url)) {
                project.setProject_quality_inspection_report_url(project_quality_inspection_report_url.getOriginalFilename());
            }
        }
        if (acceptance_report != null) {
            if (FileUtils.fileUpload(acceptance_report)) {
                project.setAcceptance_report(acceptance_report.getOriginalFilename());
            }
        }
        boolean b = projectService.addProject(project);
        Result result = new Result();
        if (b) {
            result.setCode(true);
            result.setMsg("创建项目成功");
        } else {
            result.setCode(false);
            result.setMsg("项目创建失败,请重新创建");
        }
        return result;
    }

    @RequestMapping("/deleteProject")
    public Result deleteProject(int id) {
        boolean b = projectService.deleteProject(id);
        Result result = new Result();
        if (b) {
            result.setCode(true);
            result.setMsg("删除成功");
        } else {
            result.setCode(false);
            result.setMsg("删除失败,请确认信息再删除");
        }
        return result;
    }

    @RequestMapping("/selectOne")
    public Project selectOne(int id) {
        return projectService.selectOne(id);
    }

    @RequestMapping("/updateProject")
    public Result updateProject(Project project, @RequestParam("review_document_url") MultipartFile review_document_url, @RequestParam("technical_design_book_url") MultipartFile technical_design_book_url,
                                @RequestParam("technical_summary_url") MultipartFile technical_summary_url, @RequestParam("project_quality_inspection_report_url") MultipartFile project_quality_inspection_report_url,
                                @RequestParam("acceptance_report") MultipartFile acceptance_report) {
        Project project1 = projectService.selectOne(project.getId());
        if (!project1.getReview_document_url().equals(review_document_url.getOriginalFilename())) {
            if (FileUtils.deleteFile(project1.getReview_document_url())) {
                if (FileUtils.fileUpload(review_document_url)) {
                    project.setReview_document_url(review_document_url.getOriginalFilename());
                }
            }
        }
        if (!project1.getTechnical_design_book_url().equals(technical_design_book_url.getOriginalFilename())) {
            if (FileUtils.deleteFile(project1.getTechnical_design_book_url())) {
                if (FileUtils.fileUpload(technical_design_book_url)) {
                    project.setTechnical_design_book_url(technical_design_book_url.getOriginalFilename());
                }
            }
        }
        if (!project1.getTechnical_summary_url().equals(technical_summary_url.getOriginalFilename())){
            if (FileUtils.deleteFile(project1.getTechnical_summary_url())){
                if (FileUtils.fileUpload(technical_summary_url)){
                    project.setTechnical_summary_url(technical_summary_url.getOriginalFilename());
                }
            }
        }
        if (!project1.getProject_quality_inspection_report_url().equals(project_quality_inspection_report_url.getOriginalFilename())){
            if (FileUtils.deleteFile(project1.getProject_quality_inspection_report_url())){
                if (FileUtils.fileUpload(project_quality_inspection_report_url)){
                    project.setProject_quality_inspection_report_url(project_quality_inspection_report_url.getOriginalFilename());
                }
            }
        }
        if (!project1.getAcceptance_report().equals(acceptance_report.getOriginalFilename())){
            if (FileUtils.deleteFile(project1.getAcceptance_report())){
                if(FileUtils.fileUpload(acceptance_report)){
                    project.setAcceptance_report(acceptance_report.getOriginalFilename());
                }
            }
        }
        boolean b = projectService.updateProject(project);
        Result result = new Result();
        if (b) {
            result.setCode(true);
            result.setMsg("修改成功");
        } else {
            result.setCode(false);
            result.setMsg("修改失败");
        }
        return result;
    }
}
