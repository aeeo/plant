package fun.no2.plant.plantface.bean;

import javax.persistence.Column;

public class TeachCourseInfo {
    private String teachId;
    private String teachName;
    private int teachCourseId;
    private int courseId;
    private String courseName;

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public TeachCourseInfo() {
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

    public int getTeachCourseId() {
        return teachCourseId;
    }

    public void setTeachCourseId(int teachCourseId) {
        this.teachCourseId = teachCourseId;
    }

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public TeachCourseInfo(String teachId, String teachName, int teachCourseId, int courseId) {
        this.teachId = teachId;
        this.teachName = teachName;
        this.teachCourseId = teachCourseId;
        this.courseId = courseId;
    }
    public TeachCourseInfo(String teachId, String teachName, int courseId ,String courseName) {
        this.teachId = teachId;
        this.teachName = teachName;
        this.courseId = courseId;
        this.courseName = courseName;
    }

    @Override
    public String toString() {
        return "TeachCourseInfo{" +
                "teachId='" + teachId + '\'' +
                ", teachName='" + teachName + '\'' +
                ", teachCourseId=" + teachCourseId +
                ", courseId=" + courseId +
                '}';
    }
}
