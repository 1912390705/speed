package com.gjdt.modules.project.dao;

import com.gjdt.modules.entity.ManagerProject;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
public interface ManagerProjectMapper {
    void addManagerProject(int project_id, int manager_id);

    List<ManagerProject> selectByProjectId(int project_id);

    void deleteProjectManager(Integer id);

    boolean updateManagerProject(int manager_id, int id1);
}
