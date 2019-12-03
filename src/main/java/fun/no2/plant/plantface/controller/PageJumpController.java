package fun.no2.plant.plantface.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageJumpController {

    @RequestMapping(value = "/")
    public String defaultPage(){
        return "login";
    }
    @RequestMapping(value = "/register")
    public String register(){
        return "register";
    }


    @RequestMapping(value = "/teachIndex")
    public String teachIndex(){
        return "teachIndex";
    }

    @RequestMapping(value = "/teachLogin")
    public String teachLogin(){
        return "teachLogin";
    }
}
