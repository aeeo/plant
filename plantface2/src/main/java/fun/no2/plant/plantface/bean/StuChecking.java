package fun.no2.plant.plantface.bean;

//考勤统计
public class StuChecking {
    private String stuId;
    private String stuCourse;
    private String stuArrive;
    private String stuAbsence;
    private String stuTeach;
    private String stuRemark;

    public StuChecking() {
    }

    public StuChecking(String stuId, String stuCourse, String stuArrive, String stuAbsence, String stuTeach, String stuRemark) {
        this.stuId = stuId;
        this.stuCourse = stuCourse;
        this.stuArrive = stuArrive;
        this.stuAbsence = stuAbsence;
        this.stuTeach = stuTeach;
        this.stuRemark = stuRemark;
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
}
