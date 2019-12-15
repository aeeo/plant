package fun.no2.plant.plantface.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class OtherController {
    @RequestMapping(value = "quit")
    public String quit(HttpServletRequest request) {
        request.getSession().invalidate();
        return "teachLogin";
    }
}
