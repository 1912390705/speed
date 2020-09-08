package com.gjdt.modules.project.dao;

import com.gjdt.modules.entity.Project;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
public interface ProjectMapper {
    List<Project> selectAll(Integer project_Manager_Id);

    boolean addProject(Project project);

    boolean deleteProject(int id);

    Project selectOne(int id);

    boolean updateProject(Project project);
}
