package com.gjdt.modules.manager.service.impl;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gjdt.modules.entity.Department;
import com.gjdt.modules.entity.Manager;
import com.gjdt.modules.entity.Role;
import com.gjdt.modules.manager.dao.DepartmentMapper;
import com.gjdt.modules.manager.dao.ManagerMapper;
import com.gjdt.modules.manager.dao.RoleMapper;
import com.gjdt.modules.manager.service.ManagerService;
import com.gjdt.modules.util.TokenUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service("ManagerService")
public class ManagerServiceImpl implements ManagerService {
    @Resource
    private ManagerMapper managerMapper;
    @Resource
    private RoleMapper roleMapper;
    @Resource
    private DepartmentMapper departmentMapper;

    @Override
    public Manager selectOne(String user_Name, String password) {
        return managerMapper.selectOne(user_Name, password);
    }

    @Override
    public Role selectRole(int role_id) {
        return roleMapper.selectRole(role_id);
    }

    @Override
    public boolean addManager(Manager manager) {
        return managerMapper.addManager(manager);
    }

    @Override
    public PageInfo<Manager> selectAll(int pageNum,int pageSize) {
        Integer id  = Integer.parseInt(TokenUtil.getTokenManagerId());
        Manager manager = managerMapper.selectOneById(id);
        PageHelper.startPage(pageNum,pageSize);
        String department = null;
        if (roleMapper.selectRole(manager.getRole_id()).getRole_type()!=1){
            department=manager.getDepartment();
        }
        List<Manager> managers = managerMapper.selectAll(roleMapper.selectRole(manager.getRole_id()).getRole_type(),department);
        PageInfo pageInfo = new PageInfo(managers);
        return pageInfo;
    }

    @Override
    public Manager selectOneById(int id) {
        return managerMapper.selectOneById(id);
    }

    @Override
    public boolean updateManager(Manager manager) {
        return managerMapper.updateManager(manager);
    }

    @Override
    public boolean deleteManager(int[] ids) {
        return managerMapper.deleteManager(ids);
    }

    @Override
    public List<Role> selectAllRole() {
        return roleMapper.selectAllRole();
    }

    @Override
    public List<Department> selectDepartment() {
        return departmentMapper.selectDepartment();
    }

    @Override
    public PageInfo<Manager> searchManager(Integer status, String department, String real_name, int pageNum, int pageSize) {
        Integer id  = Integer.parseInt(TokenUtil.getTokenManagerId());
        Manager manager = managerMapper.selectOneById(id);
        if (roleMapper.selectRole(manager.getRole_id()).getRole_type()!=1){
            department=manager.getDepartment();
        }
        PageHelper.startPage(pageNum,pageSize);
        List<Manager> managers = managerMapper.searchManager(status,department,real_name,roleMapper.selectRole(manager.getRole_id()).getRole_type());
        PageInfo<Manager> pageInfo = new PageInfo<>(managers);
        return pageInfo;
    }
}
