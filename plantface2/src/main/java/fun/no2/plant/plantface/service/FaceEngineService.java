package fun.no2.plant.plantface.service;

import com.arcsoft.face.toolkit.ImageInfo;
import fun.no2.plant.plantface.bean.StuFaceAccount;


import java.util.List;
import java.util.concurrent.ExecutionException;


public interface FaceEngineService {
//
//    List<FaceInfo> detectFaces(ImageInfo imageInfo);
//
//    List<ProcessInfo> process(ImageInfo imageInfo);
//
//    /**
//     * 人脸特征
//     * @param imageInfo

//     * @return
//     */
    byte[] extractFaceFeature(ImageInfo imageInfo) throws InterruptedException;
//
    /**
     * 人脸比对
     */
    List<StuFaceAccount> compareFaceFeature(byte[] faceFeature) throws InterruptedException, ExecutionException;
//


}
