package com.gjdt.modules.project.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import com.gjdt.modules.entity.Manager;
import com.gjdt.modules.entity.ManagerProject;
import com.gjdt.modules.entity.Project;
import com.gjdt.modules.manager.dao.ManagerMapper;
import com.gjdt.modules.manager.dao.RoleMapper;
import com.gjdt.modules.project.dao.ManagerProjectMapper;
import com.gjdt.modules.project.dao.ProjectMapper;
import com.gjdt.modules.project.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("ProjectService")
public class ProjectServiceImpl implements ProjectService {
    @Resource
    private ProjectMapper projectMapper;
    @Resource
    private ManagerMapper managerMapper;
    @Resource
    private ManagerProjectMapper managerProjectMapper;
    @Resource
    private RoleMapper roleMapper;

    @Override
    public PageInfo<Project> selectAllProject(@Value("") int pageNum, int pageSize, Integer project_Manager_Id) {
        if (managerMapper.selectOneById(project_Manager_Id).getRole().getRole_type()==1){
            project_Manager_Id = null;
        }
        PageHelper.startPage(pageNum,pageSize);
        List<Project> projects = projectMapper.selectAll(project_Manager_Id);
        for (Project project : projects) {
            project.setManagers(managerMapper.selectProject(project.getId()));
        }
        PageHelper.startPage(pageNum,pageSize);
        return new PageInfo(projects);
    }

    @Override
    public boolean addProject(Project project) {
        for (Manager manager : project.getManagers()) {
            managerProjectMapper.addManagerProject(project.getId(), manager.getId());
        }
        return projectMapper.addProject(project);
    }

    @Override
    public boolean deleteProject(int id) {
        List<ManagerProject> managerProjectList = managerProjectMapper.selectByProjectId(id);
        for (ManagerProject managerProject : managerProjectList) {
            managerProjectMapper.deleteProjectManager(managerProject.getId());
        }
        return projectMapper.deleteProject(id);
    }

    @Override
    public Project selectOne(int id) {
        Project project = projectMapper.selectOne(id);
        project.setManagers(managerMapper.selectProject(id));
        return project;
    }

    @Override
    public boolean updateProject(Project project) {
        boolean b = projectMapper.updateProject(project);
        if(b){
            List<ManagerProject> managerProjects = managerProjectMapper.selectByProjectId(project.getId());
            for(Manager manager : project.getManagers()){
                boolean c = true;
                for(ManagerProject managerProject : managerProjects){
                    if(managerProject.getManager_id()==manager.getId()){
                        c=false;
                        break;
                    }
                }
                if(c){
                    for (ManagerProject managerProject : managerProjects){
                        boolean d = true;
                        for (Manager manager1 : project.getManagers()){
                            if (manager1.getId()==managerProject.getManager_id()){
                                d=false;
                                break;
                            }
                        }
                        b = managerProjectMapper.updateManagerProject(manager.getId(),managerProject.getId());
                    }
                }
            }
        }
        return b;
    }
}
