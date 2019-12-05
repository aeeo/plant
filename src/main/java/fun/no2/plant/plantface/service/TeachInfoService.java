package fun.no2.plant.plantface.service;

import fun.no2.plant.plantface.bean.Course;
import fun.no2.plant.plantface.bean.TeachInfo;

import java.util.List;

public interface TeachInfoService {

    TeachInfo teachAccountQuery(String teachId);

    List<Course> courseQuery();
}
