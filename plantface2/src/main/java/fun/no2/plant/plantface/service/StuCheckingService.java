package fun.no2.plant.plantface.service;

import fun.no2.plant.plantface.bean.StuChecking;

import java.util.List;

public interface StuCheckingService {
    List<StuChecking> queryChecking(String stuId);
}
