package fun.no2.plant.plantface.service.impl;

import fun.no2.plant.plantface.bean.TeachAccount;
import fun.no2.plant.plantface.mapper.TeachAccountMapper;
import fun.no2.plant.plantface.mapper.TeachMapper;
import fun.no2.plant.plantface.service.TeachAccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TeachAccountServiceImpl implements TeachAccountService {
    @Autowired
    TeachAccountMapper teachAccountMapper;

    @Override
    public TeachAccount teachAccountQuery(String teachId) {
        TeachAccount teachAccount = new TeachAccount();
        teachAccount.setTeachId(teachId);
        TeachAccount teachAccount1 = teachAccountMapper.selectOne(teachAccount);
        return teachAccount1;
    }

    @Override
    public int teachAccountInsert(TeachAccount teachAccount) {
        int i = teachAccountMapper.insertSelective(teachAccount);
        return i;
    }

}
