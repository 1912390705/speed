package com.gjdt.modules.staff.service.impl;

import com.gjdt.modules.entity.Manager;
import com.gjdt.modules.entity.Task;
import com.gjdt.modules.manager.dao.ManagerMapper;
import com.gjdt.modules.staff.dao.TaskMapper;
import com.gjdt.modules.staff.service.StaffService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class StaffServiceImpl implements StaffService {
    @Resource
    private ManagerMapper managerMapper;
    @Resource
    private TaskMapper taskMapper;
    @Override
    public Manager selectByOneId(String username, String password) {
        return managerMapper.selectOne(username,password);
    }

    @Override
    public boolean changePassword(Manager manager) {
        return managerMapper.updateManager(manager);
    }

    @Override
    public boolean addTask(Task task) {
        return taskMapper.addTask(task);
    }

    @Override
    public List<Manager> selectStaff() {
        return managerMapper.selectStaff();
    }

    @Override
    public List<Task> selectIsExamine(int staffName) {
        return taskMapper.selectIsExamine(staffName);
    }

    @Override
    public boolean updateTask(Task task) {
        return taskMapper.updateTask(task);
    }

    @Override
    public List<Task> displayWorkload(int staffName) {
        return taskMapper.displayWorkload(staffName);
    }

    @Override
    public boolean deleteTask(int id) {
        return taskMapper.deleteTask(id);
    }
}
