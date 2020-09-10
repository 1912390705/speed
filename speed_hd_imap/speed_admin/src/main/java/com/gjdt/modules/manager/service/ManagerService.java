package com.gjdt.modules.manager.service;


import com.github.pagehelper.PageInfo;
import com.gjdt.modules.entity.Department;
import com.gjdt.modules.entity.Manager;
import com.gjdt.modules.entity.Role;

import java.util.List;

public interface ManagerService  {
    Manager selectOne(String user_Name, String password);

    Role selectRole(int role_id);

    boolean addManager(Manager manager);

    PageInfo<Manager> selectAll(int pageNum,int pageSize);

    Manager selectOneById(int id);

    boolean updateManager(Manager manager);

    boolean deleteManager(int[] ids);

    List<Role> selectAllRole();

    List<Department> selectDepartment();

    PageInfo<Manager> searchManager(Integer status, String department, String real_name, int pageNum, int pageSize);
}
