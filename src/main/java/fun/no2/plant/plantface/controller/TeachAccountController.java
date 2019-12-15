package fun.no2.plant.plantface.controller;

import com.sun.org.apache.xpath.internal.operations.Mod;
import fun.no2.plant.plantface.bean.*;
import fun.no2.plant.plantface.service.*;
import org.apache.ibatis.annotations.Param;
import org.junit.Test;
import org.junit.runners.Parameterized;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
public class TeachAccountController {
    @Autowired
    TeachAccountService teachAccountService;

    @Autowired
    TeachInfoService teachInfoService;

    @Autowired
    OtherService otherService;

    @Autowired
    TeachCourseInfoService teachCourseInfoService;

    @Autowired
    StuInfoService stuInfoService;
    @Autowired
    StuCheckingService stuCheckingService;



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
    @RequestMapping(value = "classQuery")
    @ResponseBody
    public List<StuClass> classQuery(@Param(value = "majorId") String majorId){
        List<StuClass> stuClassList = otherService.queryStuClass(majorId);
        return stuClassList  ;
    }

    //根据教师id查询教师所有课程
    @RequestMapping(value = "/queryTeachCourseTable")
    @ResponseBody
    public List<TeachCourseTableInfo>  queryTeachCourseTable(@Param(value = "teachId") String teachId, ModelMap map) {

//        List<StuClass> stuClassList = otherService.queryStuClass(teachId);

        List<TeachCourseTableInfo> teachCourseTableInfoList = teachCourseInfoService.queryTeachCourseTableByTeachId(teachId);

        map.put("teachCourseTableInfoList", teachCourseTableInfoList);
        return teachCourseTableInfoList;
    }

    @RequestMapping(value = "deleteCourse")
    @ResponseBody
    public String deleteCourse(@Param(value = "teachCourseId") String teachCourseId) {
        int deleteCourse = teachCourseInfoService.deleteCourse(teachCourseId);
        int deleteCourseSite = teachCourseInfoService.deleteCourseSite(teachCourseId);
        int deleteCourseStu = teachCourseInfoService.deleteCourseStu(teachCourseId);
        int deleteCourseCheck = teachCourseInfoService.deleteCourseSChecktao(teachCourseId);

        if (deleteCourse != 0 && deleteCourseSite != 0 && deleteCourseStu != 0 && deleteCourseCheck != 0) {
            return "success";
        } else {
            return "fail";
        }
    }

    @RequestMapping(value = "lookCourse")
    @ResponseBody
    public List<StuChecking> lookCourse(@Param(value = "teachCourseId") String teachCourseId, ModelMap map) {
        List<StuChecking> stuCheckings = stuCheckingService.queryCheckingByCourseId(teachCourseId);
        map.put("stuCheckings", stuCheckings);
        return stuCheckings;
    }


    //create student class
    @RequestMapping(value = "/makeClass")
    @ResponseBody
    public int makeClass(@Param(value = "teachId") String teachId,
                                    @Param(value = "course") String course,
                                    @Param(value = "courseName") String courseName,
                                    @Param(value = "courseSite") String courseSite,
                                    @Param(value = "major") String major,
                                    @RequestParam(value = "siteCheckbox[]") String[] siteCheckbox,
                                    @RequestParam(value = "classCheckbox[]") String[] classCheckbox
                                    ){
        //query teacher information by teachId
        TeachAccount teachAccount = teachAccountService.teachAccountQuery(teachId);
        TeachCourseInfo teachCourseInfo = new TeachCourseInfo(teachAccount.getTeachId(), teachAccount.getTeachName(), Integer.parseInt(course),courseName);

        //insert teacher course
        int i = teachCourseInfoService.insertCourse (teachCourseInfo);
        System.out.println(teachCourseInfo.toString());

        //insert teacher course site
        List<String> courseSection = new ArrayList<>();
        List<String> courseDay = new ArrayList<>();
        for (int j = 0; j < siteCheckbox.length; j++) {
            String[] strings = siteCheckbox[j].split("_");
            courseDay.add(strings[1]);
            courseDay.add(strings[1]);
            for (int k = 2; k < strings.length; k++) {
                courseSection.add(strings[k]);
            }
        }
        System.out.println(courseSection);
        System.out.println(courseDay);
        int i1 = 0;
        for (int j = 0; j < courseSection.size(); j++) {
            TeachCourseSite teachCourseSite = new TeachCourseSite(teachCourseInfo.getTeachCourseId(),courseSite,courseSection.get(j),courseDay.get(j));
            teachCourseInfoService.insertCourseSite(teachCourseSite);
            i1++;
        }

        //insert course'student
        List<StuInfo> stuInfoList = stuInfoService.queryStuByMajorClass(major, classCheckbox);

        for (StuInfo stuinfo : stuInfoList) {
            TeachCourseStu teachCourseStu = new TeachCourseStu(teachCourseInfo.getTeachCourseId(),stuinfo.getStuId());
            teachCourseInfoService.insertCourseStu(teachCourseStu);
        }

        //每个学生创建一个考勤信息记录
        for (StuInfo stuInfo : stuInfoList) {
            StuChecking stuChecking = new StuChecking(stuInfo.getStuId(),stuInfo.getStuName(), String.valueOf(teachCourseInfo.getTeachCourseId()),teachCourseInfo.getCourseName(), "0", "0", teachCourseInfo.getTeachName(), "");
            stuCheckingService.addStuChecking(stuChecking);
        }

        return i;
    }

}
