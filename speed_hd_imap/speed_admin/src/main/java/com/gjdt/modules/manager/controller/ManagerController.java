package com.gjdt.modules.manager.controller;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gjdt.modules.annotation.PassToken;
import com.gjdt.modules.annotation.UserLoginToken;
import com.gjdt.modules.entity.Department;
import com.gjdt.modules.entity.Manager;
import com.gjdt.modules.entity.Result;
import com.gjdt.modules.entity.Role;
import com.gjdt.modules.manager.service.ManagerService;
import com.gjdt.modules.util.RandomValidateCode;
import com.gjdt.modules.util.TokenUtil;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

import static com.gjdt.modules.util.TokenUtil.getRequest;

@RestController
@RequestMapping("/manager")
public class ManagerController {
    @Resource
    private ManagerService managerService;

    /*
     * 登录功能
     * */
    @RequestMapping("/logIn")
    @ResponseBody
    public Object managerLogin(String user_Name, String password, HttpServletResponse response,HttpSession session) {
        JSONObject jsonObject = new JSONObject();
        Manager manager = managerService.selectOne(user_Name, password);
        if (manager == null) {
            jsonObject.put("code",false);
            jsonObject.put("message","登录失败,用户名或密码错误");
        } else {
            String token = TokenUtil.getToken(manager,session);
            jsonObject.put("code",true);
            jsonObject.put("manager",manager);
            jsonObject.put("token",token);
            Cookie cookie = new Cookie("token",token);
            cookie.setPath("/");
            cookie.setMaxAge(60*15);
            response.addCookie(cookie);
        }
        return jsonObject;
    }

    /**
     * 登录页面生成验证码
     */
    @RequestMapping(value = "/getVerify")
    public void getVerify(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("image/jpeg");//设置相应类型,告诉浏览器输出的内容为图片
        response.setHeader("Pragma", "No-cache");//设置响应头信息，告诉浏览器不要缓存此内容
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expire", 0);
        RandomValidateCode randomValidateCode = new RandomValidateCode();
        try {
            randomValidateCode.getRandcode(request, response);//输出验证码图片方法
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 登录页面校验验证码
     */
    @RequestMapping(value = "/checkVerify")
    @ResponseBody
    public String checkVerify(String inputStr, HttpSession session) {
        //从session中获取随机数
        String random = (String) session.getAttribute("WEILAIWANGLUOSHIYEBU");
        if (random.equals(inputStr)) {
            return "TURE";//验证码正确
        } else {
            return "FALSE";//验证码错误
        }
    }

    /*
     * 添加员工信息
     * */
    @RequestMapping("/addManager")
    public Result addManager(Manager manager, HttpServletResponse response) {
        boolean b = managerService.addManager(manager);
        Result result = new Result();
        if (b) {
            result.setCode(true);
            result.setMsg("添加员工成功");
        } else {
            result.setCode(false);
            result.setMsg("添加员工失败");
        }
        return result;
    }

    /*
     * 管理员主页面查询所有员工信息
     * */
    @PassToken
    @RequestMapping("/selectAll")
    @ResponseBody
    public PageInfo<Manager> selectAll(@RequestParam("page_index") int pageNum, @RequestParam(value = "page_size") int pageSize) {
        return managerService.selectAll(pageNum,pageSize);
    }

    /*
     * 根据id查询单个员工信息
     * */
    @RequestMapping("/selectOneById")
    public Manager selectOneById(int id) {
        Manager manager = managerService.selectOneById(id);
        return manager;
    }

    /*
     * 修改员工的个人信息
     * */
    @RequestMapping("/updateManager")
    public Result updateManager(Manager manager) {
        boolean b = managerService.updateManager(manager);
        Result result = new Result();
        if (b) {
            result.setCode(true);
            result.setMsg("修改成功");
        } else {
            result.setCode(false);
            result.setMsg("修改失败");
        }
        return result;
    }

    /*
     * 删除员工的信息
     * */
    @RequestMapping("/deleteManager")
    public Result deleteManager(String ids) {
        String[] split = ids.split(";");
        int[] idps = new int[split.length];
        for (int i =0;i<split.length;i++){
            idps[i]=Integer.parseInt(split[i]);
        }
        boolean b = managerService.deleteManager(idps);
        Result result = new Result();
        if (b) {
            result.setCode(true);
            result.setMsg("删除成功");
        } else {
            result.setCode(false);
            result.setMsg("删除失败,请重新删除");
        }
        return result;
    }

    @RequestMapping("/selectAllRole")
    @ResponseBody
    public List<Role> selectAllRole() {
        return managerService.selectAllRole();
    }

    @RequestMapping("/selectManager")
    public Manager selectManager(int id) {
        return managerService.selectOneById(id);
    }
    @PassToken
    @RequestMapping("/exit")
    public ModelAndView exit(HttpServletResponse response) {
        String token = getRequest().getParameter("token");
        Cookie cookie = new Cookie("token",token);
        cookie.setPath("/");
        cookie.setMaxAge(0);
        response.addCookie(cookie);
        return new ModelAndView("redirect:/logOutIndex");
    }
    @RequestMapping("/selectDepartment")
    public List<Department> selectDepartment(){
          return managerService.selectDepartment();
    }
    @RequestMapping("searchManager")
    public PageInfo<Manager> searchManager(Integer status,String department,String real_name,
                                           int page_index,int page_size){
        System.out.println(real_name);
        return managerService.searchManager(status,department,real_name,page_index,page_size);
    }

}
