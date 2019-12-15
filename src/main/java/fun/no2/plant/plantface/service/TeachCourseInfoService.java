package fun.no2.plant.plantface.service;

import fun.no2.plant.plantface.bean.TeachCourseInfo;
import fun.no2.plant.plantface.bean.TeachCourseSite;
import fun.no2.plant.plantface.bean.TeachCourseStu;
import fun.no2.plant.plantface.bean.TeachCourseTableInfo;

import java.util.List;

public interface TeachCourseInfoService {

    //teacher insert course
    int insertCourse(TeachCourseInfo teachCourseInfo);

    int insertCourseSite(TeachCourseSite teachCourseSite);

    void insertCourseStu(TeachCourseStu teachCourseStu);

    //根据教师id查询该教师所有课程信息
    List<TeachCourseTableInfo> queryTeachCourseTableByTeachId(String teachId);

    int deleteCourse(String teachCourseId);

    int deleteCourseSite(String teachCourseId);

    int deleteCourseStu(String teachCourseId);

    int deleteCourseSChecktao(String teachCourseId);

    //teach course insert to course Site

}
