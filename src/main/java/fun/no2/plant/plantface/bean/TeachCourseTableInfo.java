package fun.no2.plant.plantface.bean;

public class TeachCourseTableInfo {
    private int teachCourseId;
    private String courseName;
    private String courseSite;
    private String courseSection;
    private String classId;
    private String majorName;

    public int getTeachCourseId() {
        return teachCourseId;
    }

    public void setTeachCourseId(int teachCourseId) {
        this.teachCourseId = teachCourseId;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getCourseSite() {
        return courseSite;
    }

    public void setCourseSite(String courseSite) {
        this.courseSite = courseSite;
    }

    public String getCourseSection() {
        return courseSection;
    }

    public void setCourseSection(String courseSection) {
        this.courseSection = courseSection;
    }

    public String getClassId() {
        return classId;
    }

    public void setClassId(String classId) {
        this.classId = classId;
    }

    public String getmajorName() {
        return majorName;
    }

    public void setmajorName(String majorName) {
        this.majorName = majorName;
    }

    public TeachCourseTableInfo(int teachCourseId, String courseName, String courseSite, String courseSection, String classId, String majorName) {
        this.teachCourseId = teachCourseId;
        this.courseName = courseName;
        this.courseSite = courseSite;
        this.courseSection = courseSection;
        this.classId = classId;
        this.majorName = majorName;
    }
    public TeachCourseTableInfo() {

    }

    @Override
    public String toString() {
        return "TeachCourseTableInfo{" +
                "teachCourseId=" + teachCourseId +
                ", courseName='" + courseName + '\'' +
                ", courseSite='" + courseSite + '\'' +
                ", courseSection='" + courseSection + '\'' +
                ", classId='" + classId + '\'' +
                ", majorName='" + majorName + '\'' +
                '}';
    }
}
