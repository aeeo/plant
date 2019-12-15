package fun.no2.plant.plantface.bean;

public class TeachCourseStu {
    private int teachCourseId;
    private String stuId;

    public TeachCourseStu() {
    }

    public TeachCourseStu(int teachCourseId, String stuId) {
        this.teachCourseId = teachCourseId;
        this.stuId = stuId;
    }

    @Override
    public String toString() {
        return "TeachCourseStu{" +
                "teachCourseId=" + teachCourseId +
                ", stuId=" + stuId +
                '}';
    }

    public int getTeachCourseId() {
        return teachCourseId;
    }

    public void setTeachCourseId(int teachCourseId) {
        this.teachCourseId = teachCourseId;
    }

    public String getStuId() {
        return stuId;
    }

    public void setStuId(String stuId) {
        this.stuId = stuId;
    }
}
