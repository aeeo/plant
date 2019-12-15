package fun.no2.plant.plantface.mapper;

import fun.no2.plant.plantface.bean.TeachCourseStu;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;
import java.util.Map;

public interface TeachCourseStuMapper extends Mapper<TeachCourseStu>{
    @Insert({"insert into teach_course_stu (teach_course_id,stu_id) values(#{teachCourseId},#{stuId})"})
    void insertTeachCourseStu(TeachCourseStu teachCourseStu);

    List<Map<String,String>> selectStuMajorClassByCourseId(int teachCourseId);

    @Delete("delete from teach_course_stu where teach_course_id = #{teachCourseId}")
    int deleteCourseStuByCourseId(String teachCourseId);

}
