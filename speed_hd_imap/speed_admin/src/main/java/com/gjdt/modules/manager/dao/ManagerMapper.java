package com.gjdt.modules.manager.dao;



import com.gjdt.modules.entity.Manager;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;


import java.util.List;
@Mapper
public interface ManagerMapper {
    Manager selectOne(@Param("user_name") String user_name, @Param("password") String password);

    boolean addManager(Manager manager);

    List<Manager> selectAll(int role_type,String department);

    Manager selectOneById(int id);

    boolean updateManager(Manager manager);

    boolean deleteManager(int[] id);

    List<Manager> selectProject(int id);

    List<Manager> selectStaff();

    List<Manager> searchManager(Integer status, String department, String real_name,int role_type);
}
