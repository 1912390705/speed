package com.gjdt.modules.page;

import com.gjdt.modules.annotation.PassToken;
import com.gjdt.modules.annotation.UserLoginToken;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {

    @PassToken
    @RequestMapping(value = {"/", "logOutIndex"})
    public String index(){
        return "logOutIndex";
    }

    @UserLoginToken
    @RequestMapping("logInIndex")
    public String login(){
        return "logInIndex";
    }

    @PassToken
    @RequestMapping("/html")
    public String page(String page){
        return page;
    }


}
