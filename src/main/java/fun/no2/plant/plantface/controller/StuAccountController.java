package fun.no2.plant.plantface.controller;

import com.mysql.cj.x.protobuf.MysqlxDatatypes;
import fun.no2.plant.plantface.bean.StuChecking;
import fun.no2.plant.plantface.bean.StuFaceAccount;
import fun.no2.plant.plantface.bean.StuInfo;
import fun.no2.plant.plantface.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

@Controller
public class StuAccountController {

    @Autowired
    StuInfoService stuInfoService;
    @Autowired
    StuCheckingService stuCheckingService;
    @Autowired
    StuFaceAccountService stuFaceAccountService;
    @Autowired
    FaceService faceService;

    @RequestMapping(value = "/accountLogin", method = RequestMethod.POST)
    public String accountLogin(@RequestParam("userId") String userId,
                               @RequestParam("userPassword") String userPassword,
                               HttpServletResponse response,
                               HttpServletRequest request) {
        StuFaceAccount stuFaceAccount = stuFaceAccountService.queryAccount(userId, userPassword);
        HttpSession session = request.getSession();
        session.setAttribute("newLogin", "0");
        if (stuFaceAccount != null) {
            Cookie cookie = new Cookie("stuId", stuFaceAccount.getUserId());
            //存在时间，单位为秒，下边表示存半小时，与session一样
            cookie.setMaxAge(60 * 30);
            //把cookie存到response中，响应时将把cookie信息带回浏览器，保存到浏览器中
            response.addCookie(cookie);
            return "redirect:index";
        } else {
            return "login";
        }

    }

    @RequestMapping(value = "/stuInfoQuery")
    @ResponseBody
    public StuInfo stuInfoQuery(@RequestParam String stuId) {
        StuInfo stuInfos = stuInfoService.stuInfoQuery(stuId);
        return stuInfos;
    }

    @RequestMapping(value = "/stuStuInfoMod")
    @ResponseBody
    public String stuStuInfoMod(@RequestParam String inStuId,
                                @RequestParam String inStuName,
                                @RequestParam String inStuSex,
                                @RequestParam String inStuSchool,
                                @RequestParam String inStuDepart,
                                @RequestParam String inStuMajor,
                                @RequestParam String inStuGrade,
                                @RequestParam String inStuClass,
                                @RequestParam String inStuPhone){
        StuInfo stuInfo = new StuInfo(inStuId, inStuName, inStuSex, inStuSchool, inStuDepart, inStuMajor, inStuGrade, inStuClass, inStuPhone);
        StuInfo stuInfo1 = stuInfoService.stuInfoQuery(inStuId);

        int n = stuInfoService.stuInfoUpdata(stuInfo);
        if (n == 0) {
            return "fail";
        }else{
            return "success";
        }
    }

    @RequestMapping(value = "/stuChecking")
    @ResponseBody
    public List<StuChecking> stuChecking(@RequestParam String stuId){
        List<StuChecking> stuCheckingList = stuCheckingService.queryChecking(stuId);
        return stuCheckingList  ;
    }



    @RequestMapping(value = "/modStuPassword")
    @ResponseBody
    public String modStuPassword(@RequestParam String stuId,@RequestParam String oldPassword, @RequestParam String newPassword) {
        StuFaceAccount stuFaceAccount = stuFaceAccountService.queryStuFaceAccount(stuId);
        String userPassword = stuFaceAccount.getUserPassword();
        if (userPassword.equals(oldPassword)) {
            stuFaceAccount.setUserPassword(newPassword);
            int n = stuFaceAccountService.updateStuFaceAccount(stuFaceAccount);
            if (n != 0) {
                return "success";
            }else{
                return "fail";
            }

        } else {
            return "fail";
        }
    }

    //学生注册
    @RequestMapping(value = "/stuRegister")
    @ResponseBody
    public String stuRegister(@RequestParam String file,
                              @RequestParam String inStuId,
                              @RequestParam String inStuPassword,
                              @RequestParam String inStuName,
                              @RequestParam String inStuSex,
                              @RequestParam String inStuSchool,
                              @RequestParam String inStuDepart,
                              @RequestParam String inStuMajor,
                              @RequestParam String inStuGrade,
                              @RequestParam String inStuClass,
                              @RequestParam String inStuPhone,
                              HttpServletRequest request,
                              HttpServletResponse response) {


        //判断是否已经存在该学号并插入
        StuFaceAccount stuFaceAccount = stuFaceAccountService.queryStuFaceAccount(inStuId);
        if (null == stuFaceAccount) {
            String str = faceService.faceAdd(file, inStuId, inStuPassword, inStuName);
            if ("success".equals(str)) {
                StuInfo stuInfo = new StuInfo(inStuId, inStuName, inStuSex, inStuSchool, inStuDepart, inStuMajor, inStuGrade, inStuClass, inStuPhone);
                int insertInfo = stuInfoService.stuInfoInsert(stuInfo);
                if (insertInfo == 1) {
                    HttpSession session = request.getSession();
                    session.setAttribute("newLogin", "0");

                    Cookie cookie = new Cookie("stuId", inStuId);
                    //存在时间，单位为秒，下边表示存半小时，与session一样
                    cookie.setMaxAge(60*30);
                    //把cookie存到response中，响应时将把cookie信息带回浏览器，保存到浏览器中
                    response.addCookie(cookie);
                    return "register success";
                } else {
                    return "register fail";
                }
            } else if ("fail".equals(str)) {

                System.out.println("插入失败！");
                return "register fail";
            }
        }

//StuFaceAccount stuFaceAccount = new StuFaceAccount(inStuId,inStuPassword,inStuName,in);

        return null;
    }
}
