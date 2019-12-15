package fun.no2.plant.plantface.mapper;

import fun.no2.plant.plantface.bean.StuInfo;
import org.apache.ibatis.annotations.Select;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface  StuInfoServiceMapper extends Mapper<StuInfo> {
    @Select("select stu_id as stuId,stu_name as stuName,stu_sex as stuSex,stu_school as stuSchool,    stu_depart as stuDepart,    stu_major as stuMajor," +
            "    stu_grade as stuGrade,    stu_class as stuClass,     stu_phone as stuPhone from stu_info where stu_major = #{major} and stu_class = #{classCheckbox}")
    List<StuInfo> queryStuByMajorClass(String major, String classCheckbox);

}
