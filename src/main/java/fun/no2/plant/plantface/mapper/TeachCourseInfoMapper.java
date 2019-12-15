package fun.no2.plant.plantface.mapper;

import fun.no2.plant.plantface.bean.TeachCourseInfo;
import org.apache.ibatis.annotations.*;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

@org.apache.ibatis.annotations.Mapper
public interface TeachCourseInfoMapper extends Mapper<TeachCourseInfo> {
    @Insert({"insert into teach_course_info (teach_id,teach_name,course_id,course_name) values (#{teachId},#{teachName},#{courseId},#{courseName})"})
    @Options(useGeneratedKeys=true, keyProperty="teachCourseId", keyColumn="teach_course_id")
    int insertByNoCourseId(TeachCourseInfo teachCourseInfo);

    List<TeachCourseInfo> selectTeachCourseById(@Param("teachId") String teachId);

    @Delete("delete from teach_course_info where teach_course_id = #{teachCourseId}")
    int deleteTeachCourseByCourseId(String teachCourseId);
}
