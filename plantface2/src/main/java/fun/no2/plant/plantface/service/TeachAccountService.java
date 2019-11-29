package fun.no2.plant.plantface.service;

import fun.no2.plant.plantface.bean.TeachAccount;
import org.springframework.stereotype.Service;

/**
 * 教师账户密码操作
 */

public interface TeachAccountService {
    //根据id查询教师
    TeachAccount teachAccountQuery(String teachId);

    //添加教师
    int teachAccountInsert(TeachAccount teachAccount);
}
