package fun.no2.plant.plantface.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController {
    @RequestMapping(value = "index1")
    public String index1() {
        return "index1";
    }

    @RequestMapping(value = "login")
    public String login() {
        return "login";
    }

    @RequestMapping(value = "logoutSession")
    public String logoutSession(HttpServletRequest request) {
        request.getSession().invalidate();
        return "index";
    }

    @RequestMapping(value = "/index")
    public String index(HttpServletRequest request) {
        if(request.getSession().getAttribute("newLogin") == "0"){
            return "index";
        }else{
            return "login";
        }
    }
}
