package fun.no2.plant.plantface.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import com.arcsoft.face.*;
import com.arcsoft.face.enums.DetectMode;
import com.arcsoft.face.enums.DetectOrient;
import com.arcsoft.face.toolkit.ImageInfo;
import com.google.common.collect.Lists;

import fun.no2.plant.plantface.bean.StuFaceAccount;
import fun.no2.plant.plantface.factory.FaceEngineFactory;
import fun.no2.plant.plantface.mapper.MybatisUserFaceInfoMapper;
import fun.no2.plant.plantface.service.FaceEngineService;
import org.apache.commons.pool2.impl.GenericObjectPool;
import org.apache.commons.pool2.impl.GenericObjectPoolConfig;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.*;


@Service
public class FaceEngineServiceImpl implements FaceEngineService {


    public final static Logger logger = LoggerFactory.getLogger(FaceEngineServiceImpl.class);

    @Value("${config.arcface-sdk.sdk-lib-path}")
    public String sdkLibPath;
    @Value("${config.arcface-sdk.app-id}")
    public String appId;

    @Value("${config.arcface-sdk.sdk-key}")
    public String sdkKey;

    @Value("${config.arcface-sdk.thread-pool-size}")
    public Integer threadPoolSize;


    private Integer passRate = 80;

    private ExecutorService executorService;

    @Autowired
    private MybatisUserFaceInfoMapper userFaceInfoMapper;

    private GenericObjectPool<FaceEngine> faceEngineObjectPool;

    @PostConstruct
    public void init() {
        executorService = Executors.newFixedThreadPool(threadPoolSize);
        GenericObjectPoolConfig poolConfig = new GenericObjectPoolConfig();
        poolConfig.setMaxIdle(threadPoolSize);
        poolConfig.setMaxTotal(threadPoolSize);
        poolConfig.setMinIdle(threadPoolSize);
        poolConfig.setLifo(false);

        //引擎配置
        EngineConfiguration engineConfiguration = new EngineConfiguration();
        engineConfiguration.setDetectMode(DetectMode.ASF_DETECT_MODE_IMAGE);
        engineConfiguration.setDetectFaceOrientPriority(DetectOrient.ASF_OP_0_ONLY);

        //功能配置
        FunctionConfiguration functionConfiguration = new FunctionConfiguration();
        functionConfiguration.setSupportAge(true);
        functionConfiguration.setSupportFace3dAngle(true);
        functionConfiguration.setSupportFaceDetect(true);
        functionConfiguration.setSupportFaceRecognition(true);
        functionConfiguration.setSupportGender(true);
        functionConfiguration.setSupportLiveness(true);
        functionConfiguration.setSupportIRLiveness(true);
        engineConfiguration.setFunctionConfiguration(functionConfiguration);


        faceEngineObjectPool = new GenericObjectPool(new FaceEngineFactory(sdkLibPath, appId, sdkKey, engineConfiguration), poolConfig);//底层库算法对象池
        System.out.println("引擎初始化成功...");
    }


    private int plusHundred(Float value) {
        BigDecimal target = new BigDecimal(value);
        BigDecimal hundred = new BigDecimal(100f);
        return target.multiply(hundred).intValue();

    }

    public List<FaceInfo> detectFaces(ImageInfo imageInfo) {
        FaceEngine faceEngine = null;
        try {
            //获取引擎对象
            faceEngine = faceEngineObjectPool.borrowObject();

            //人脸检测得到人脸列表
            List<FaceInfo> faceInfoList = new ArrayList<FaceInfo>();

            //人脸检测
            faceEngine.detectFaces(imageInfo.getImageData(), imageInfo.getWidth(), imageInfo.getHeight(), imageInfo.getImageFormat(), faceInfoList);
            return faceInfoList;
        } catch (Exception e) {
            logger.error("", e);
        } finally {
            if (faceEngine != null) {
                //释放引擎对象
                faceEngineObjectPool.returnObject(faceEngine);
            }
        }
        return null;
    }

/*
    @Override
    public List<ProcessInfo> process(ImageInfo imageInfo) {
        FaceEngine faceEngine = null;
        try {
            //获取引擎对象
            faceEngine = faceEngineObjectPool.borrowObject();
            //人脸检测得到人脸列表
            List<FaceInfo> faceInfoList = new ArrayList<FaceInfo>();
            //人脸检测
            faceEngine.detectFaces(imageInfo.getImageData(), imageInfo.getWidth(), imageInfo.getHeight(), imageInfo.getImageFormat(), faceInfoList);
            int processResult = faceEngine.process(imageInfo.getImageData(), imageInfo.getWidth(), imageInfo.getHeight(), imageInfo.getImageFormat(), faceInfoList, FunctionConfiguration.builder().supportAge(true).supportGender(true).build());
            List<ProcessInfo> processInfoList = Lists.newLinkedList();

            List<GenderInfo> genderInfoList = new ArrayList<GenderInfo>();
            //性别提取
            int genderCode = faceEngine.getGender(genderInfoList);
            //年龄提取
            List<AgeInfo> ageInfoList = new ArrayList<AgeInfo>();
            int ageCode = faceEngine.getAge(ageInfoList);
            for (int i = 0; i < genderInfoList.size(); i++) {
                ProcessInfo processInfo = new ProcessInfo();
                processInfo.setGender(genderInfoList.get(i).getGender());
                processInfo.setAge(ageInfoList.get(i).getAge());
                processInfoList.add(processInfo);
            }
            return processInfoList;

        } catch (Exception e) {
            logger.error("", e);
        } finally {
            if (faceEngine != null) {
                //释放引擎对象
                faceEngineObjectPool.returnObject(faceEngine);
            }
        }

        return null;

    }
*/

    /**
     * 人脸特征
     *
     * @param imageInfo
     * @return
     *//*
     */
    @Override
    public byte[] extractFaceFeature(ImageInfo imageInfo) throws InterruptedException {
        System.out.println("人脸提取...");
        FaceEngine faceEngine = null;
        try {
            //获取引擎对象
            faceEngine = faceEngineObjectPool.borrowObject();

            //人脸检测得到人脸列表
            List<FaceInfo> faceInfoList = new ArrayList<FaceInfo>();

            //人脸检测
            int i = faceEngine.detectFaces(imageInfo.getImageData(), imageInfo.getWidth(), imageInfo.getHeight(), imageInfo.getImageFormat(), faceInfoList);
            System.out.println("人脸个数：" + i + "...");
            if (CollectionUtil.isNotEmpty(faceInfoList)) {
                FaceFeature faceFeature = new FaceFeature();
                //提取人脸特征
                faceEngine.extractFaceFeature(imageInfo.getImageData(), imageInfo.getWidth(), imageInfo.getHeight(), imageInfo.getImageFormat(), faceInfoList.get(0), faceFeature);

                return faceFeature.getFeatureData();
            }
        } catch (Exception e) {
            logger.error("", e);
        } finally {
            if (faceEngine != null) {
                //释放引擎对象
                faceEngineObjectPool.returnObject(faceEngine);
            }

        }

        return null;
    }

    @Override
    public List<StuFaceAccount> compareFaceFeature(byte[] faceFeature) throws InterruptedException, ExecutionException {
        List<StuFaceAccount> resultFaceInfoList = Lists.newLinkedList();//识别到的人脸列表

        FaceFeature targetFaceFeature = new FaceFeature();
        targetFaceFeature.setFeatureData(faceFeature);
        List<StuFaceAccount> faceInfoPartList = userFaceInfoMapper.selectAll(); //从数据库中取出人脸库
        List<List<StuFaceAccount>> faceUserInfoPartList = Lists.partition(faceInfoPartList, 1000);//分成1000一组，多线程处理
        CompletionService<List<StuFaceAccount>> completionService = new ExecutorCompletionService(executorService);

        //将查询到的数据库所有信息与提交的照片进行对比
        for (List<StuFaceAccount> part : faceUserInfoPartList) {
            completionService.submit(new CompareFaceTask(part, targetFaceFeature));
        }
        List<StuFaceAccount> faceStuFaceAccountInfoList = completionService.take().get();
        if (CollectionUtil.isNotEmpty(faceInfoPartList)) {
            resultFaceInfoList.addAll(faceStuFaceAccountInfoList);
        }


        resultFaceInfoList.sort((h1, h2) -> h2.getSimilarValue().compareTo(h1.getSimilarValue()));//从大到小排序
        return resultFaceInfoList;
    }

    private class CompareFaceTask implements Callable<List<StuFaceAccount>> {

        private List<StuFaceAccount> faceStuFaceAccountInfoList;
        private FaceFeature targetFaceFeature;


        public CompareFaceTask(List<StuFaceAccount> faceStuFaceAccountInfoList, FaceFeature targetFaceFeature) {
            this.faceStuFaceAccountInfoList = faceStuFaceAccountInfoList;
            this.targetFaceFeature = targetFaceFeature;
        }

        @Override
        public List<StuFaceAccount> call() throws Exception {
            FaceEngine faceEngine = null;
            List<StuFaceAccount> resultFaceInfoList = Lists.newLinkedList();//识别到的人脸列表
            try {
                faceEngine = faceEngineObjectPool.borrowObject();
                for (StuFaceAccount faceStuFaceAccountInfo : faceStuFaceAccountInfoList) {
                    FaceFeature sourceFaceFeature = new FaceFeature();
                    sourceFaceFeature.setFeatureData(faceStuFaceAccountInfo.getUserFeature());
                    FaceSimilar faceSimilar = new FaceSimilar();
                    faceEngine.compareFaceFeature(targetFaceFeature, sourceFaceFeature, faceSimilar);
                    Integer similarValue = plusHundred(faceSimilar.getScore());//获取相似值
                    if (similarValue > passRate) {//相似值大于配置预期，加入到识别到人脸的列表

                        StuFaceAccount info = new StuFaceAccount();
                        info.setUserName(faceStuFaceAccountInfo.getUserName());
                        info.setUserId(faceStuFaceAccountInfo.getUserId());
                        info.setUserPassword(faceStuFaceAccountInfo.getUserPassword());
                        info.setUserFeature(faceStuFaceAccountInfo.getUserFeature());
                        info.setSimilarValue(similarValue);
                        resultFaceInfoList.add(info);
                    }
                }
            } catch (Exception e) {
                logger.error("", e);
            } finally {
                if (faceEngine != null) {
                    faceEngineObjectPool.returnObject(faceEngine);
                }
            }

            return resultFaceInfoList;
        }

    }

}