package com.gjdt.modules.project.service;

import com.github.pagehelper.PageInfo;
import com.gjdt.modules.entity.Project;
import org.springframework.stereotype.Component;

@Component
public interface ProjectService {
    PageInfo selectAllProject(int pageNum,int pageSize,Integer project_Manager_Id);

    boolean addProject(Project project);

    boolean deleteProject(int id);

    Project selectOne(int id);

    boolean updateProject(Project project);
}
