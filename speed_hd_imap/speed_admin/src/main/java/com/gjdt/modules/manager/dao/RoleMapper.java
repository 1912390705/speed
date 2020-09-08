package com.gjdt.modules.manager.dao;


import com.gjdt.modules.entity.Role;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface RoleMapper {
    Role selectRole(int id);

    List<Role> selectAllRole();
}
