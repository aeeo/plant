package fun.no2.plant.plantface.bean;

public class TeachCourseSite {
    private int teachCourseId;
    private String courseSite;
    private String courseSection;
    private String courseDay;

    public int getTeachCourseId() {
        return teachCourseId;
    }

    public void setTeachCourseId(int teachCourseId) {
        this.teachCourseId = teachCourseId;
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

    public String getCourseDay() {
        return courseDay;
    }

    public void setCourseDay(String courseDay) {
        this.courseDay = courseDay;
    }

    public TeachCourseSite(int teachCourseId, String courseSite, String courseSection, String courseDay) {
        this.teachCourseId = teachCourseId;
        this.courseSite = courseSite;
        this.courseSection = courseSection;
        this.courseDay = courseDay;
    }
    public TeachCourseSite() {
    }
}
