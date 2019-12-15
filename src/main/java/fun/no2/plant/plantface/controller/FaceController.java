package fun.no2.plant.plantface.controller;

import com.arcsoft.face.toolkit.ImageFactory;
import com.arcsoft.face.toolkit.ImageInfo;
import fun.no2.plant.plantface.bean.StuFaceAccount;
import fun.no2.plant.plantface.service.FaceEngineService;
import fun.no2.plant.plantface.service.FaceService;
import fun.no2.plant.plantface.service.StuFaceAccountService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import cn.hutool.core.codec.Base64;

import javax.imageio.ImageIO;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.util.List;


@Controller
public class FaceController {

    public final static Logger logger = LoggerFactory.getLogger(FaceController.class);
    @Autowired
    FaceService faceService;

    @Autowired
    FaceEngineService faceEngineService;


    @Autowired
    StuFaceAccountService stuFaceAccountService;

     /*
    人脸添加
     */
    @RequestMapping(value = "/faceAdd", method = RequestMethod.POST)
    @ResponseBody
    public String faceAdd(@RequestParam("file") String file, @RequestParam("userId") String userId, @RequestParam("userPassword") String userPassword, @RequestParam("userName") String userName) {

        try {
            /*if (file == null) {
                return Results.newFailedResult("file is null");
            }
            if (groupId == null) {
                return Results.newFailedResult("groupId is null");
            }
            if (name == null) {
                return Results.newFailedResult("name is null");
            }*/

            byte[] decode = Base64.decode(base64Process(file));
            ImageInfo imageInfo = ImageFactory.getRGBData(decode);
            System.out.println(userId + " " + userName);
            //人脸特征获取
            byte[] bytes = faceEngineService.extractFaceFeature(imageInfo);

            if (bytes == null) {
                return "noface";
            }

            StuFaceAccount stuFaceAccount = new StuFaceAccount();
            stuFaceAccount.setUserId(userId);
            stuFaceAccount.setUserPassword(userPassword);
            stuFaceAccount.setUserName(userName);
            stuFaceAccount.setUserFeature(bytes);
            System.out.println(stuFaceAccount.toString());
            //人脸特征插入到数据库
            stuFaceAccountService.insertSelective(stuFaceAccount);
            System.out.println("插入成功");
            logger.info("faceAdd:" + userName);
            return "success";
        } catch (Exception e) {
            System.out.println("人脸添加异常");
        }
        return "fail";
    }


    //    人脸识别对比
    @RequestMapping(value = "/faceRecogn", method = RequestMethod.POST)
    @ResponseBody
    public String faceRecogn(String file, HttpServletRequest request, HttpServletResponse response) throws Exception {

        byte[] decode = Base64.decode(base64Process(file));
        BufferedImage bufImage = ImageIO.read(new ByteArrayInputStream(decode));
        ImageInfo imageInfo = ImageFactory.bufferedImage2ImageInfo(bufImage);

        //人脸特征获取
        byte[] bytes = faceEngineService.extractFaceFeature(imageInfo);
        if (bytes == null) {
            return null;
        }
        //人脸比对，获取比对结果
        List<StuFaceAccount> stuFaceAccountFaceInfoList = faceEngineService.compareFaceFeature(bytes);
        Cookie cookie = new Cookie("stuId",stuFaceAccountFaceInfoList.get(0).getUserId());
        //存在时间，单位为秒，下边表示存半小时
        cookie.setMaxAge(60*30);
        //把cookie存到response中，响应时将把cookie信息带回浏览器，保存到浏览器中
        response.addCookie(cookie);
        HttpSession session = request.getSession();
        session.setAttribute("newLogin", "0");
//        return "redirect:index";
        return "success";
        /*
        if (CollectionUtil.isNotEmpty(userFaceInfoList)) {
            User user = userFaceInfoList.get(0);
            FaceSearchResDto faceSearchResDto = new FaceSearchResDto();
            BeanUtil.copyProperties(faceUserInfo, faceSearchResDto);
            List<ProcessInfo> processInfoList = faceEngineService.process(imageInfo);
            if (CollectionUtil.isNotEmpty(processInfoList)) {
                //人脸检测
                List<FaceInfo> faceInfoList = faceEngineService.detectFaces(imageInfo);
                int left = faceInfoList.get(0).getRect().getLeft();
                int top = faceInfoList.get(0).getRect().getTop();
                int width = faceInfoList.get(0).getRect().getRight() - left;
                int height = faceInfoList.get(0).getRect().getBottom() - top;

                Graphics2D graphics2D = bufImage.createGraphics();
                graphics2D.setColor(Color.RED);//红色
                BasicStroke stroke = new BasicStroke(5f);
                graphics2D.setStroke(stroke);
                graphics2D.drawRect(left, top, width, height);
                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                ImageIO.write(bufImage, "jpg", outputStream);
                byte[] bytes1 = outputStream.toByteArray();
                faceSearchResDto.setImage("data:image/jpeg;base64," + Base64Utils.encodeToString(bytes1));
                faceSearchResDto.setAge(processInfoList.get(0).getAge());
                faceSearchResDto.setGender(processInfoList.get(0).getGender().equals(1) ? "女" : "男");

            }

            return "失败";
        }
        return "失败";*/
    }

    private String base64Process(String base64Str) {
        if (!StringUtils.isEmpty(base64Str)) {
                String photoBase64 = base64Str.substring(0, 30).toLowerCase();
                int indexOf = photoBase64.indexOf("base64,");
                if (indexOf > 0) {
                    base64Str = base64Str.substring(indexOf + 7);
                }

                return base64Str;
            } else {
                return "";
        }
    }
}
