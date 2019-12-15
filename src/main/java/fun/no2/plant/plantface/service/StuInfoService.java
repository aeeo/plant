package fun.no2.plant.plantface.service;

import fun.no2.plant.plantface.bean.StuFaceAccount;
import fun.no2.plant.plantface.bean.StuInfo;

import java.util.List;

public interface StuInfoService {
    StuInfo stuInfoQuery(String stuId);

    int stuInfoUpdata(StuInfo stuInfo);

    int stuInfoInsert(StuInfo stuInfo);

    List<StuInfo> queryStuByMajorClass(String major, String[] classCheckbox);
}
