package fun.no2.plant.plantface.service;

import fun.no2.plant.plantface.bean.StuChecking;

import java.util.List;

public interface StuCheckingService {
    List<StuChecking> queryChecking(String stuId);

    //创建课程后为每个学生创建该课程考勤记录
    void addStuChecking(StuChecking stuChecking);

    List<StuChecking> queryCheckingByCourseId(String teachCourseId);

}
