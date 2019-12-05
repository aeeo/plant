package fun.no2.plant.plantface.bean;

public class TeachInfo {
    private String teachId;
    private String teachName;
    private String teachSex;
    private String teachSchool;
    private String teachDepart;
    private String teachMajor;
    private String teachGrade;
    private String teachTitle;
    private String teachPhone;

    public TeachInfo() {
    }

    public TeachInfo(String teachId, String teachName, String teachSex, String teachSchool, String teachDepart, String teachMajor, String teachGrade, String teachTitle, String teachPhone) {
        this.teachId = teachId;
        this.teachName = teachName;
        this.teachSex = teachSex;
        this.teachSchool = teachSchool;
        this.teachDepart = teachDepart;
        this.teachMajor = teachMajor;
        this.teachGrade = teachGrade;
        this.teachTitle = teachTitle;
        this.teachPhone = teachPhone;
    }

    public String getTeachId() {
        return teachId;
    }

    public void setTeachId(String teachId) {
        this.teachId = teachId;
    }

    public String getTeachName() {
        return teachName;
    }

    public void setTeachName(String teachName) {
        this.teachName = teachName;
    }

    public String getTeachSex() {
        return teachSex;
    }

    public void setTeachSex(String teachSex) {
        this.teachSex = teachSex;
    }

    public String getTeachSchool() {
        return teachSchool;
    }

    public void setTeachSchool(String teachSchool) {
        this.teachSchool = teachSchool;
    }

    public String getTeachDepart() {
        return teachDepart;
    }

    public void setTeachDepart(String teachDepart) {
        this.teachDepart = teachDepart;
    }

    public String getTeachMajor() {
        return teachMajor;
    }

    public void setTeachMajor(String teachMajor) {
        this.teachMajor = teachMajor;
    }

    public String getTeachGrade() {
        return teachGrade;
    }

    public void setTeachGrade(String teachGrade) {
        this.teachGrade = teachGrade;
    }

    public String getTeachTitle() {
        return teachTitle;
    }

    public void setTeachTitle(String teachTitle) {
        this.teachTitle = teachTitle;
    }

    public String getTeachPhone() {
        return teachPhone;
    }

    public void setTeachPhone(String teachPhone) {
        this.teachPhone = teachPhone;
    }
}
