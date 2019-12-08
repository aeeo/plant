package fun.no2.plant.plantface.service;

import fun.no2.plant.plantface.bean.Depart;
import fun.no2.plant.plantface.bean.Major;
import fun.no2.plant.plantface.bean.StuClass;

import java.util.List;

public interface OtherService {
    List<Depart> departQuery();

    List<Major> majorQuery(String departId);

    List<StuClass> queryStuClass(String majorId);
}
