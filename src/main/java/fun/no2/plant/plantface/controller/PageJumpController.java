package fun.no2.plant.plantface.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

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
    public String teachIndex(HttpServletRequest request){
        if ("0".equals(request.getSession().getAttribute("newTeachLogin"))) {
            return "teachIndex";
        } else {
            return "teachLogin";
        }

    }

    @RequestMapping(value = "/teachLogin")
    public String teachLogin(){
        return "teachLogin";
    }

    @RequestMapping(value = "/teachStuCheck")
    public String teachStuCheck(HttpServletRequest request) {
        if ("0".equals(request.getSession().getAttribute("newTeachLogin"))) {
            return "teachStuCheck";
        } else {
            return "teachLogin";
        }
    }


    @RequestMapping(value = "/teachCourse")
    public String teachCourse(HttpServletRequest request){
        if ("0".equals(request.getSession().getAttribute("newTeachLogin"))) {
            return "teachCourse";
        } else {
            return "teachLogin";
        }
    }
    @RequestMapping(value = "/teachMess")
    public String teachMess(HttpServletRequest request){
        if ("0".equals(request.getSession().getAttribute("newTeachLogin"))) {
            return "teachMess";
        } else {
            return "teachLogin";
        }
    }
    @RequestMapping(value = "teachInfoMod")
    public String teachInfoMod(HttpServletRequest request){
        if ("0".equals(request.getSession().getAttribute("newTeachLogin"))) {
            return "teachInfoMod";
        } else {
            return "teachLogin";
        }
    }

    @RequestMapping(value = "/teachCourseTable")
    public String teachCourseTable(HttpServletRequest request){
        if ("0".equals(request.getSession().getAttribute("newTeachLogin"))) {
            return "teachCourseTable";
        } else {
            return "teachLogin";
        }
    }
    @RequestMapping(value = "/help")
    public String help(){
        return "help";
    }
    @RequestMapping(value = "/contact")
    public String contact(HttpServletRequest request){
    return "contact";
    }


}
