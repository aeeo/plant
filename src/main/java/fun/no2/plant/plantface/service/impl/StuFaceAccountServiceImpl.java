package fun.no2.plant.plantface.service.impl;

import fun.no2.plant.plantface.bean.StuFaceAccount;
import fun.no2.plant.plantface.mapper.AccountMapper;
import fun.no2.plant.plantface.mapper.MybatisUserFaceInfoMapper;
import fun.no2.plant.plantface.service.StuFaceAccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 学生面部识别账户接口
 */

@Service
public class StuFaceAccountServiceImpl implements StuFaceAccountService {


    @Autowired
    private MybatisUserFaceInfoMapper mybatisUserFaceInfoMapper;

    @Autowired
    AccountMapper accountMapper;
    @Override
    public StuFaceAccount queryAccount(String userId, String userPassword) {
        StuFaceAccount stuFaceAccount = new StuFaceAccount();
        stuFaceAccount.setUserId(userId);
        List<StuFaceAccount> stuFaceAccountList = accountMapper.select(stuFaceAccount);
        if (!userPassword.equals(stuFaceAccountList.get(0).getUserPassword())) {
            return null;
        }
        return stuFaceAccountList.get(0);
    }

    @Override
    public int insertSelective(StuFaceAccount stuFaceAccount) {
        int i = mybatisUserFaceInfoMapper.insertSelective(stuFaceAccount);
        return i;
    }

    @Override
    public int updateStuFaceAccount(StuFaceAccount stuFaceAccount) {
        mybatisUserFaceInfoMapper.updataStuFaceAccount(stuFaceAccount);
        return 1;
    }


    @Override
    public StuFaceAccount queryStuFaceAccount(String stuId) {
        StuFaceAccount stuFaceAccount = new StuFaceAccount();
        stuFaceAccount.setUserId(stuId);
        StuFaceAccount stuFaceAccount1 = mybatisUserFaceInfoMapper.selectOne(stuFaceAccount);
        return stuFaceAccount1;
    }

}
