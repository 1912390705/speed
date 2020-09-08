package com.gjdt.modules.staff.service;

import com.gjdt.modules.entity.Manager;
import com.gjdt.modules.entity.Task;

import java.util.List;

public interface StaffService {
    Manager selectByOneId(String username, String password);

    boolean changePassword(Manager manager);

    boolean addTask(Task task);

    List<Manager> selectStaff();

    List<Task> selectIsExamine(int staffName);

    boolean updateTask(Task task);

    List<Task> displayWorkload(int staffName);

    boolean deleteTask(int id);
}
