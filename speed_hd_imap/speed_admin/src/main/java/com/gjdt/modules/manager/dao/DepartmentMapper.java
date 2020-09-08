package com.gjdt.modules.manager.dao;

import com.gjdt.modules.entity.Department;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface DepartmentMapper {
    List<Department> selectDepartment();
}
