package fun.no2.plant.plantface.service.impl;

import fun.no2.plant.plantface.bean.Course;
import fun.no2.plant.plantface.bean.TeachInfo;
import fun.no2.plant.plantface.mapper.CourseMapper;
import fun.no2.plant.plantface.mapper.TeachMapper;
import fun.no2.plant.plantface.service.TeachInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TeachInfoServiceImpl implements TeachInfoService {
    @Autowired
    TeachMapper teachMapper;

    @Autowired
    CourseMapper courseMapper;

    @Override
    public TeachInfo teachAccountQuery(String teachId) {
        TeachInfo teachInfo = new TeachInfo();
        teachInfo.setTeachId(teachId);

        TeachInfo teachInfo1 = teachMapper.selectOne(teachInfo);
        return teachInfo1;

    }

    @Override
    public List<Course> courseQuery() {
        List<Course> courseList = courseMapper.selectAll();

        return courseList;
    }
}
