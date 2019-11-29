package fun.no2.plant.plantface.bean;

//学生个人信息
public class StuInfo {
    private String stuId;
    private String stuName;
    private String stuSex;
    private String stuSchool;
    private String stuDepart;
    private String stuMajor;
    private String stuGrade;
    private String stuClass;
    private String stuPhone;

    public StuInfo() {
    }

    @Override
    public String toString() {
        return "StuInfo{" +
                "stuId='" + stuId + '\'' +
                ", stuName='" + stuName + '\'' +
                ", stuSex='" + stuSex + '\'' +
                ", stuSchool='" + stuSchool + '\'' +
                ", stuDepart='" + stuDepart + '\'' +
                ", stuMajor='" + stuMajor + '\'' +
                ", stuGrade='" + stuGrade + '\'' +
                ", stuClass='" + stuClass + '\'' +
                ", stuPhone='" + stuPhone + '\'' +
                '}';
    }

    public StuInfo(String stuId, String stuName, String stuSex, String stuSchool, String stuDepart, String stuMajor, String stuGrade, String stuClass, String stuPhone) {
        this.stuId = stuId;
        this.stuName = stuName;
        this.stuSex = stuSex;
        this.stuSchool = stuSchool;
        this.stuDepart = stuDepart;
        this.stuMajor = stuMajor;
        this.stuGrade = stuGrade;
        this.stuClass = stuClass;
        this.stuPhone = stuPhone;
    }

    public String getStuId() {
        return stuId;
    }

    public void setStuId(String stuId) {
        this.stuId = stuId;
    }

    public String getStuName() {
        return stuName;
    }

    public void setStuName(String stuName) {
        this.stuName = stuName;
    }

    public String getStuSex() {
        return stuSex;
    }

    public void setStuSex(String stuSex) {
        this.stuSex = stuSex;
    }

    public String getStuSchool() {
        return stuSchool;
    }

    public void setStuSchool(String stuSchool) {
        this.stuSchool = stuSchool;
    }

    public String getStuDepart() {
        return stuDepart;
    }

    public void setStuDepart(String stuDepart) {
        this.stuDepart = stuDepart;
    }

    public String getStuMajor() {
        return stuMajor;
    }

    public void setStuMajor(String stuMajor) {
        this.stuMajor = stuMajor;
    }

    public String getStuGrade() {
        return stuGrade;
    }

    public void setStuGrade(String stuGrade) {
        this.stuGrade = stuGrade;
    }

    public String getStuClass() {
        return stuClass;
    }

    public void setStuClass(String stuClass) {
        this.stuClass = stuClass;
    }

    public String getStuPhone() {
        return stuPhone;
    }

    public void setStuPhone(String stuPhone) {
        this.stuPhone = stuPhone;
    }
}
