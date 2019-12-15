package fun.no2.plant.plantface.mapper;

import fun.no2.plant.plantface.bean.StuFaceAccount;
import org.apache.ibatis.annotations.Update;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;


public interface MybatisUserFaceInfoMapper extends Mapper<StuFaceAccount> {

    @Update("update stu_face_account set user_password=#{userPassword} where user_id like #{userId}")
    int updataStuFaceAccount(StuFaceAccount stuFaceAccount);
}