package fun.no2.plant.plantface.service.impl;

import fun.no2.plant.plantface.bean.StuChecking;
import fun.no2.plant.plantface.mapper.StuCheckingMapper;
import fun.no2.plant.plantface.service.StuCheckingService;
import fun.no2.plant.plantface.service.StuInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

@Service
public class StuCheckingServiceImpl implements StuCheckingService {
    @Autowired
    StuCheckingMapper stuCheckingMapper;

    @Override
    public List<StuChecking> queryChecking(@RequestParam String stuId) {
        Example example = new Example(StuChecking.class);
        example.createCriteria().andEqualTo("stuId",stuId);
        List<StuChecking> stuCheckingList = stuCheckingMapper.selectByExample(example);

        return stuCheckingList;
    }

    @Override
    public void addStuChecking(StuChecking stuChecking) {
        stuCheckingMapper.insertSelective(stuChecking);
    }

    @Override
    public List<StuChecking> queryCheckingByCourseId(String teachCourseId) {
        Example example = new Example(StuChecking.class);
        example.createCriteria().andEqualTo("teachCourseId", teachCourseId);
        List<StuChecking> stuCheckings = stuCheckingMapper.selectByExample(example);

        return stuCheckings;
    }

}
