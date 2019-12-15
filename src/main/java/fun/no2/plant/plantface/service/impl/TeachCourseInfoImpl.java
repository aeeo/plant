package fun.no2.plant.plantface.service.impl;

import fun.no2.plant.plantface.bean.TeachCourseInfo;
import fun.no2.plant.plantface.bean.TeachCourseSite;
import fun.no2.plant.plantface.bean.TeachCourseStu;
import fun.no2.plant.plantface.bean.TeachCourseTableInfo;
import fun.no2.plant.plantface.mapper.*;
import fun.no2.plant.plantface.service.TeachCourseInfoService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class TeachCourseInfoImpl implements TeachCourseInfoService {
    @Autowired
    TeachCourseInfoMapper teachCourseInfoMapper;
    @Autowired
    TeachCourseSiteMapper teachCourseSiteMapper;

    @Autowired
    TeachCourseStuMapper teachCourseStuMapper;

    @Autowired
    TeachCourseTableInfoMapper teachCourseTableInfoMapper;
    @Autowired
    StuCheckingMapper stuCheckingMapper;

    @Override
    public int insertCourse(TeachCourseInfo teachCourseInfo) {
        int i = teachCourseInfoMapper.insertByNoCourseId(teachCourseInfo);
        return i;
    }

    @Override
    public int insertCourseSite(TeachCourseSite teachCourseSite) {
        int insert = teachCourseSiteMapper.insertTeachCourseSite(teachCourseSite);
        return insert;
    }

    @Override
    public void insertCourseStu(TeachCourseStu teachCourseStu) {
        teachCourseStuMapper.insertTeachCourseStu(teachCourseStu);
    }

    @Override
    public List<TeachCourseTableInfo> queryTeachCourseTableByTeachId(String teachId) {
        TeachCourseInfo teachCourseInfo = new TeachCourseInfo();
        List<TeachCourseSite> teachCourseSites = new ArrayList<>();
        List<Map<String,String>> stuMajorClassList = new ArrayList<>();

        teachCourseInfo.setTeachId(teachId);

        List<TeachCourseInfo> teachCourseInfos = teachCourseInfoMapper.selectTeachCourseById(teachId);
        for (TeachCourseInfo teachCourseInfo1: teachCourseInfos) {
            int teachCourseId = teachCourseInfo1.getTeachCourseId();

            List<TeachCourseSite> teachCourseSites1 = teachCourseSiteMapper.selectTeachCourseSiteByCourseId(teachCourseId);
            for (TeachCourseSite teachCourseSite : teachCourseSites1) {
                teachCourseSites.add(teachCourseSite);
            }


            List<Map<String, String>> stuMajorClassList1 = teachCourseStuMapper.selectStuMajorClassByCourseId(teachCourseId);
            if (stuMajorClassList1.size() != 0) {
                for (Map<String, String> stringObjectMap : stuMajorClassList1) {
                    stringObjectMap.put("teachCourseId", String.valueOf(teachCourseId));
                    stuMajorClassList.add(stringObjectMap);
                }
            }

            for (int i = 0; i < stuMajorClassList.size() - 1; i++) {
                for (int i1 = i+1; i1 < stuMajorClassList.size(); i1++) {
                    if (stuMajorClassList.get(i).get("teachCourseId").equals(stuMajorClassList.get(i1).get("teachCourseId"))) {
                        stuMajorClassList.get(i).replace("stuClass", stuMajorClassList.get(i).get("stuClass") + "," + stuMajorClassList.get(i1).get("stuClass"));
                        stuMajorClassList.remove(i1);
                    }
                }
            }


        }
        List<Map<String,String>> section = new ArrayList<>();
        List<TeachCourseTableInfo> teachCourseTableInfoList = new ArrayList<>();
        for (int i = 0; i < teachCourseInfos.size(); i++) {

            for (int i1 = 0; i1 < teachCourseSites.size(); i1++) {
                if (teachCourseInfos.get(i).getTeachCourseId() == teachCourseSites.get(i1).getTeachCourseId()) {
                    Map<String, String> sectionMap = new HashMap<>();
                    for (TeachCourseSite teachCourseSite : teachCourseSites) {
                        if (teachCourseInfos.get(i).getTeachCourseId() == teachCourseSite.getTeachCourseId()) {

                            if (sectionMap.containsKey(teachCourseSite.getCourseDay())) {
                                String section1 = sectionMap.get(teachCourseSite.getCourseDay());
                                section1 += "," +teachCourseSite.getCourseSection();
                                sectionMap.replace(teachCourseSite.getCourseDay(), section1);
                            } else {
                                sectionMap.put(teachCourseSite.getCourseDay(), teachCourseSite.getCourseSection());
                            }
                        }
                    }
                    if (!section.contains(sectionMap)) {
                        section.add(sectionMap);
                    }
                    StringBuilder string = new StringBuilder();
                    for (String key : sectionMap.keySet()) {
                        string.append("周" + key + ":第" + sectionMap.get(key) + "节课 ");
                    }
                    for (Map<String, String> stringStringMap : stuMajorClassList) {
                        if (teachCourseInfos.get(i).getTeachCourseId() == Integer.parseInt(stringStringMap.get("teachCourseId"))) {
                            int flag = 0;
                            for (TeachCourseTableInfo teachCourseTableInfo : teachCourseTableInfoList) {
                                if (teachCourseTableInfo.getTeachCourseId() == teachCourseInfos.get(i).getTeachCourseId()) {
                                    flag = 1;
                                }
                            }
                            if(flag == 0) {
                                teachCourseTableInfoList.add(new TeachCourseTableInfo(teachCourseInfos.get(i).getTeachCourseId(), teachCourseInfos.get(i).getCourseName(), teachCourseSites.get(i1).getCourseSite(), string.toString(), stringStringMap.get("stuClass"), stringStringMap.get("stuMajor")));
                            }
                        }
                    }

                }

            }
        }

        return teachCourseTableInfoList;
    }

    @Override
    public int deleteCourse(String teachCourseId) {
        int i = teachCourseInfoMapper.deleteTeachCourseByCourseId(teachCourseId);
        return i;
    }

    @Override
    public int deleteCourseSite(String teachCourseId) {
        int i = teachCourseSiteMapper.deleteCourseByCourseId(teachCourseId);
        return i;
    }

    @Override
    public int deleteCourseStu(String teachCourseId) {
        int i = teachCourseStuMapper.deleteCourseStuByCourseId(teachCourseId);
        return i;
    }

    @Override
    public int deleteCourseSChecktao(String teachCourseId) {
        int i = stuCheckingMapper.deleteCheckByCourseId(teachCourseId);
        return i;
    }


}
