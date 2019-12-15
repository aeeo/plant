package fun.no2.plant.plantface.bean;

//考勤统计
public class StuChecking {
    private String stuId;
    private String stuCourse;
    private String stuName;
    private String stuArrive;
    private String stuAbsence;
    private String stuTeach;
    private String stuRemark;
    private String teachCourseId;

    @Override
    public String toString() {
        return "StuChecking{" +
                "stuId='" + stuId + '\'' +
                ", stuCourse='" + stuCourse + '\'' +
                ", stuName='" + stuName + '\'' +
                ", stuArrive='" + stuArrive + '\'' +
                ", stuAbsence='" + stuAbsence + '\'' +
                ", stuTeach='" + stuTeach + '\'' +
                ", stuRemark='" + stuRemark + '\'' +
                ", teachCourseId='" + teachCourseId + '\'' +
                '}';
    }

    public String getStuId() {
        return stuId;
    }

    public void setStuId(String stuId) {
        this.stuId = stuId;
    }

    public String getStuCourse() {
        return stuCourse;
    }

    public void setStuCourse(String stuCourse) {
        this.stuCourse = stuCourse;
    }

    public String getStuName() {
        return stuName;
    }

    public void setStuName(String stuName) {
        this.stuName = stuName;
    }

    public String getStuArrive() {
        return stuArrive;
    }

    public void setStuArrive(String stuArrive) {
        this.stuArrive = stuArrive;
    }

    public String getStuAbsence() {
        return stuAbsence;
    }

    public void setStuAbsence(String stuAbsence) {
        this.stuAbsence = stuAbsence;
    }

    public String getStuTeach() {
        return stuTeach;
    }

    public void setStuTeach(String stuTeach) {
        this.stuTeach = stuTeach;
    }

    public String getStuRemark() {
        return stuRemark;
    }

    public void setStuRemark(String stuRemark) {
        this.stuRemark = stuRemark;
    }

    public String getTeachCourseId() {
        return teachCourseId;
    }

    public void setTeachCourseId(String teachCourseId) {
        this.teachCourseId = teachCourseId;
    }

    public StuChecking(String stuId, String stuName, String teachCourseId, String stuCourse, String stuArrive, String stuAbsence, String stuTeach, String stuRemark) {
        this.stuId = stuId;
        this.stuCourse = stuCourse;
        this.stuName = stuName;
        this.stuArrive = stuArrive;
        this.stuAbsence = stuAbsence;
        this.stuTeach = stuTeach;
        this.stuRemark = stuRemark;
        this.teachCourseId = teachCourseId;
    }
}
