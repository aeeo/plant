package fun.no2.plant.plantface.controller;

import fun.no2.plant.plantface.bean.TeachAccount;
import fun.no2.plant.plantface.service.TeachAccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class TeachAccountController {
    @Autowired
    TeachAccountService teachAccountService;
    @RequestMapping(value = "teachLoginSubmit")
    public String teachLoginSubmit(@RequestParam String teachId, @RequestParam String teachPassword) {
        TeachAccount teachAccount = teachAccountService.teachAccountQuery(teachId);
        if (teachAccount.getTeachPassword().equals(teachPassword)) {
            System.out.println("123");
            return "redirect:teachIndex";
        }
        return "teachLogin";
    }
}
