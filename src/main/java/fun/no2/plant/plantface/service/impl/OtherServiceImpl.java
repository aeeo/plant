package fun.no2.plant.plantface.service.impl;

import fun.no2.plant.plantface.bean.Depart;
import fun.no2.plant.plantface.bean.Major;
import fun.no2.plant.plantface.bean.StuClass;
import fun.no2.plant.plantface.mapper.DepartMapper;
import fun.no2.plant.plantface.mapper.MajorMapper;
import fun.no2.plant.plantface.mapper.StuClassMapper;
import fun.no2.plant.plantface.service.OtherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

@Service
public class OtherServiceImpl implements OtherService {
    @Autowired
    DepartMapper departMapper;
    @Autowired
    MajorMapper majorMapper;
    @Autowired
    StuClassMapper stuClassMapper;

    //get all depart list information
    @Override
    public List<Depart> departQuery() {
        List<Depart> departList = departMapper.selectAll();
        return departList;
    }

    //get all major list
    @Override
    public List<Major> majorQuery(String departId) {
        //id不为空，修改属性
        Example example = new Example(Major.class);
        example.createCriteria().andEqualTo("majorDepartId", departId);
        List<Major> majorList = majorMapper.selectByExample(example);
        return majorList;
    }

    @Override
    public List<StuClass> queryStuClass(String majorId) {
        Example example = new Example(StuClass.class);

        example.createCriteria().andEqualTo("majorId", majorId);
        List<StuClass> stuClassList = stuClassMapper.selectByExample(example);
        return stuClassList;
    }
}
