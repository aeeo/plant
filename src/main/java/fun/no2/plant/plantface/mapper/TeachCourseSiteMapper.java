package fun.no2.plant.plantface.mapper;

import fun.no2.plant.plantface.bean.TeachCourseSite;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface TeachCourseSiteMapper extends Mapper<TeachCourseSite> {
    @Insert({"insert into teach_course_site (teach_course_id,course_site,course_section,course_day) values(#{teachCourseId},#{courseSite},#{courseSection},#{courseDay})"})
    int insertTeachCourseSite(TeachCourseSite teachCourseSite);


//    @Select("select * from teach_course_site where teach_course_id = #{courseId}")
    List<TeachCourseSite> selectTeachCourseSiteByCourseId(@Param("teachCourseId") int teachCourseId);

    @Delete("delete from teach_course_site where teach_course_id = #{teachCourseId}")
    int deleteCourseByCourseId(String teachCourseId);
}
