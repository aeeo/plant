package fun.no2.plant.plantface.bean;

public class TeachCourseInfo {
    private String teach_id;
    private String teach_name;
    private int teach_course_id;
    private int course_id;

    public TeachCourseInfo(String teach_id, String teach_name, int teach_course_id, int course_id) {
        this.teach_id = teach_id;
        this.teach_name = teach_name;
        this.teach_course_id = teach_course_id;
        this.course_id = course_id;
    }

    public String getTeach_id() {
        return teach_id;
    }

    public void setTeach_id(String teach_id) {
        this.teach_id = teach_id;
    }

    public String getTeach_name() {
        return teach_name;
    }

    public void setTeach_name(String teach_name) {
        this.teach_name = teach_name;
    }

    public int getTeach_course_id() {
        return teach_course_id;
    }

    public void setTeach_course_id(int teach_course_id) {
        this.teach_course_id = teach_course_id;
    }

    public int getCourse_id() {
        return course_id;
    }

    public void setCourse_id(int course_id) {
        this.course_id = course_id;
    }
}
