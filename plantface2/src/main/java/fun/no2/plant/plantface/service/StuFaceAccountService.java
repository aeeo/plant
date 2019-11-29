package fun.no2.plant.plantface.service;


import fun.no2.plant.plantface.bean.StuFaceAccount;
import tk.mybatis.mapper.common.Mapper;

public interface StuFaceAccountService{
    /**
     * 查询用户名密码是否匹配
     * 学生登录页
     * @param userName
     * @param userPassword
     * @return
     */
    StuFaceAccount queryAccount(String userName, String userPassword);

    int insertSelective(StuFaceAccount stuFaceAccount);

    int updateStuFaceAccount(StuFaceAccount stuFaceAccount);

    //根据id查询stuFaceAccount
    StuFaceAccount queryStuFaceAccount(String stuId);
}
