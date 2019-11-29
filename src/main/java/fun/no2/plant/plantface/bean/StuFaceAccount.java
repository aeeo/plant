package fun.no2.plant.plantface.bean;

import javax.persistence.Transient;
import java.io.Serializable;
import java.util.Arrays;

//学生ID密码特征值
public class StuFaceAccount{
    private String userId;
    private String userPassword;
    private String userName;
    private byte[] userFeature;
    @Transient
    private Integer similarValue;
    @Transient
    public Integer getSimilarValue() {
        return similarValue;
    }

    public StuFaceAccount() {

    }
    public StuFaceAccount(String userId, String userPassword, String userName, byte[] userFeature) {
        this.userId = userId;
        this.userPassword = userPassword;
        this.userName = userName;
        this.userFeature = userFeature;
        this.similarValue = similarValue;
    }

    public StuFaceAccount(String userId, String userPassword, String userName, byte[] userFeature, Integer similarValue) {
        this.userId = userId;
        this.userPassword = userPassword;
        this.userName = userName;
        this.userFeature = userFeature;
        this.similarValue = similarValue;
    }

    public void setSimilarValue(Integer similarValue) {
        this.similarValue = similarValue;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public byte[] getUserFeature() {
        return userFeature;
    }

    public void setUserFeature(byte[] userFeature) {
        this.userFeature = userFeature;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    @Override
    public String toString() {
        return "User{" +
                "userId='" + userId + '\'' +
                ", userPassword='" + userPassword + '\'' +
                ", userName='" + userName + '\'' +
                ", userFeature=" + Arrays.toString(userFeature) +
                '}';
    }
}
