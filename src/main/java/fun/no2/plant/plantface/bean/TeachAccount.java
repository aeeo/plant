package fun.no2.plant.plantface.bean;

public class TeachAccount {
    private String teachId;
    private String teachPassword;
    private String teachName;

    @Override
    public String toString() {
        return "TeachAccount{" +
                "teachId='" + teachId + '\'' +
                ", teachPassword='" + teachPassword + '\'' +
                ", teachName='" + teachName + '\'' +
                '}';
    }

    public String getTeachId() {
        return teachId;
    }

    public void setTeachId(String teachId) {
        this.teachId = teachId;
    }

    public String getTeachPassword() {
        return teachPassword;
    }

    public void setTeachPassword(String teachPassword) {
        this.teachPassword = teachPassword;
    }

    public String getTeachName() {
        return teachName;
    }

    public void setTeachName(String teachName) {
        this.teachName = teachName;
    }

    public TeachAccount(String teachId, String teachPassword, String teachName) {
        this.teachId = teachId;
        this.teachPassword = teachPassword;
        this.teachName = teachName;
    }
    public TeachAccount() {
    }
}
