package fun.no2.plant.plantface.mapper;

import fun.no2.plant.plantface.bean.StuChecking;
import org.apache.ibatis.annotations.Delete;
import tk.mybatis.mapper.common.Mapper;

public interface StuCheckingMapper extends Mapper<StuChecking> {
    @Delete("delete from stu_checking where teach_course_id = #{teachCourseId}")
    int deleteCheckByCourseId(String teachCourseId);
}
