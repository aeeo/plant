package fun.no2.plant.plantface.service;


import fun.no2.plant.plantface.bean.StuFaceAccount;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.List;

public interface FaceService {
    String faceAdd(String file, String userId, String userPassword, String userName);

    String faceRecogn(String file, HttpServletRequest request, HttpServletResponse response);
}
