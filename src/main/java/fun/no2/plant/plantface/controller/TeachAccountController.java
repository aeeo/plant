package fun.no2.plant.plantface.controller;

import fun.no2.plant.plantface.bean.*;
import fun.no2.plant.plantface.service.OtherService;
import fun.no2.plant.plantface.service.TeachAccountService;
import fun.no2.plant.plantface.service.TeachInfoService;
import org.apache.ibatis.annotations.Param;
import org.junit.runners.Parameterized;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class TeachAccountController {
    @Autowired
    TeachAccountService teachAccountService;

    @Autowired
    TeachInfoService teachInfoService;

    @Autowired
    OtherService otherService;

    @RequestMapping(value = "teachLoginSubmit")
    public String teachLoginSubmit(@RequestParam String teachId, @RequestParam String teachPassword, HttpServletResponse response, HttpServletRequest request) {
        TeachAccount teachAccount = teachAccountService.teachAccountQuery(teachId);
        if (teachAccount.getTeachPassword().equals(teachPassword)) {
            HttpSession session = request.getSession();
            session.setAttribute("newTeachLogin", "0");

            Cookie cookie = new Cookie("teachId", teachAccount.getTeachId());
            //存在时间，单位为秒，下边表示存半小时，与session一样
            cookie.setMaxAge(60 * 30);
            //把cookie存到response中，响应时将把cookie信息带回浏览器，保存到浏览器中
            response.addCookie(cookie);
            return "redirect:teachIndex";
        } else {
            return "teachLogin";
        }
    }



    @RequestMapping(value = "teachInfoQuery")
    @ResponseBody
    public TeachInfo teachInfoQuery(@Param("teachId") String teachId ) {
        TeachInfo teachInfo = teachInfoService.teachAccountQuery(teachId);
        return teachInfo;
    }


    @RequestMapping(value = "courseQuery")
    @ResponseBody
    public List<Course> courseQuery() {
        List<Course> courseList = teachInfoService.courseQuery();
        return courseList;
    }
    //get all depart information
    @RequestMapping(value = "departQuery")
    @ResponseBody
    public List<Depart> departQuery() {
        List<Depart> departList = otherService.departQuery();
        return departList;
    }

    //get all major information
    @RequestMapping(value = "majorQuery")
    @ResponseBody
    public List<Major> majorQuery(@Param(value = "departId") String departId) {
        List<Major> departList = otherService.majorQuery(departId);
        return departList;
    }
    //query major student class
    @RequestMapping(value = "/classQuery")
    @ResponseBody
    public List<StuClass> classQuery(@Param(value = "majorId") String majorId){
        List<StuClass> stuClassList = otherService.queryStuClass(majorId);
        return stuClassList  ;
    }


    //create student class
    @RequestMapping(value = "/makeClass")
    @ResponseBody
    public List<StuClass> makeClass(){

        return null  ;
    }

}
