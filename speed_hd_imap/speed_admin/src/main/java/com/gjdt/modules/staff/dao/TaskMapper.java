package com.gjdt.modules.staff.dao;

import com.gjdt.modules.entity.Task;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TaskMapper {
    boolean addTask(Task task);

    List<Task> selectIsExamine(int staffName);

    boolean updateTask(Task task);

    List<Task> displayWorkload(int staffName);

    boolean deleteTask(int id);
}
