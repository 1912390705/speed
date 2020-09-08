package com.gjdt.modules.staff.controller;

import com.gjdt.modules.entity.Manager;
import com.gjdt.modules.entity.Result;
import com.gjdt.modules.entity.Task;
import com.gjdt.modules.staff.service.StaffService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping("staff")
public class StaffController {
    @Resource
    private StaffService staffService;
    @RequestMapping("staffLogin")
    public Result staffLogin(String username, String password, HttpSession session){
        Manager manager = staffService.selectByOneId(username,password);
        Result result = new Result();
        if (manager==null){
            result.setCode(false);
            result.setMsg("账户或密码错误");
        }else {
            session.setAttribute("staff", manager);
            result.setCode(true);
            result.setMsg("登录成功");
        }
        return result;
    }
    @RequestMapping("changePassword")
    public Result changePassword(String oldPassword,String newPassword,HttpSession session ){
        Result result = new Result();
        Manager manager = (Manager)session.getAttribute("staff");
        if (oldPassword.equals(manager.getPassword())){
            manager.setPassword(newPassword);
            boolean b = staffService.changePassword(manager);
            if (b){
                result.setCode(true);
                result.setMsg("修改成功");
            }else {
                result.setCode(false);
                result.setMsg("修改失败");
            }
        }else {
            result.setCode(false);
            result.setMsg("旧密码错误,请确认后重新输入");
        }
        return result;
    }
    @RequestMapping("exit")
    public ModelAndView  exit(HttpSession session){
        session.removeAttribute("staff");
        return new ModelAndView("login");
    }
    @RequestMapping("addTask")
    public Result addTask(Task task,HttpSession session){
        Manager manager = (Manager) session.getAttribute("username");
        task.setProjectManager(manager.getId());
        boolean b  = staffService.addTask(task);
        Result result = new Result();
        if (b){
            result.setCode(true);
            result.setMsg("添加成功");
        }else {
            result.setCode(false);
            result.setMsg("添加失败");
        }
        return result;
    }
    @RequestMapping("selectStaff")
    public List<Manager> selectStaff(){
        return staffService.selectStaff();
    }
    @RequestMapping("selectIsExamine")
    public List<Task> selectIsExamine(HttpSession session){
        Manager manager = (Manager) session.getAttribute("staff");
        return staffService.selectIsExamine(manager.getId());
    }
    @RequestMapping("updateExamine")
    public ModelAndView updateExamine(Task task){
        task.setIsExamine(1);
        boolean b = staffService.updateTask(task);
        if (b){
            return new ModelAndView("");
        }
        return new ModelAndView("");

    }
    @RequestMapping("updateTask")
    public Result updateTask(Task task){
        task.setIsExamine(0);
        boolean b = staffService.updateTask(task);
        Result result = new Result();
        if (b){
            result.setCode(true);
            result.setMsg("任务修改成功");
        }else{
            result.setCode(false);
            result.setMsg("任务修改失败");
        }
        return result;
    }
    /*
    * 传过来的是员工id
    * */
    @RequestMapping("displayWorkload")
    public List<Task>displayWorkload(int id){
        return staffService.displayWorkload(id);
    }
    @RequestMapping("deleteTask")
    public Result deleteTask(int id){
        boolean b  = staffService.deleteTask(id);
        Result result = new Result();
        if (b){
            result.setCode(true);
            result.setMsg("任务删除成功");
        }else {
            result.setCode(false);
            result.setMsg("任务删除失败");
        }
        return  result;
    }
}
