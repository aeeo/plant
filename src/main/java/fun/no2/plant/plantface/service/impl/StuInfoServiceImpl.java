package fun.no2.plant.plantface.service.impl;

import fun.no2.plant.plantface.bean.StuInfo;
import fun.no2.plant.plantface.mapper.StuInfoServiceMapper;
import fun.no2.plant.plantface.service.StuInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.ArrayList;
import java.util.List;

/**
 * 学生详细信息接口
 */
@Service
public class StuInfoServiceImpl implements StuInfoService {

    @Autowired
    StuInfoServiceMapper stuInfoServiceMapper;

    @Override
    public StuInfo stuInfoQuery(String stuId) {
        StuInfo stuInfo = new StuInfo();
        stuInfo.setStuId(stuId);
        return stuInfoServiceMapper.selectOne(stuInfo);
    }

    @Override
    public int stuInfoUpdata(StuInfo stuInfo) {
        Example example = new Example(StuInfo.class);
        example.createCriteria().andEqualTo("stuId",stuInfo.getStuId());
        int n = stuInfoServiceMapper.updateByExampleSelective(stuInfo, example);
        return n;
    }

    @Override
    public int stuInfoInsert(StuInfo stuInfo) {
        int i = stuInfoServiceMapper.insertSelective(stuInfo);
        return i;
    }

    @Override
    public List<StuInfo> queryStuByMajorClass(String major, String[] classCheckbox) {
        List<StuInfo> stuInfoList = new ArrayList<>();
        for (int i = 0; i < classCheckbox.length; i++) {
            List<StuInfo> stuInfoList1 = new ArrayList<>();
            stuInfoList1 = stuInfoServiceMapper.queryStuByMajorClass(major, classCheckbox[i]);
            for (StuInfo stuInfo : stuInfoList1) {
                stuInfoList.add(stuInfo);
            }
        }

        return stuInfoList;
    }

}
