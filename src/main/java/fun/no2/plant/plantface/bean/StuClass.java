package fun.no2.plant.plantface.bean;

//考勤统计
public class StuClass {
    private String classId;
    private String majorId;
    private String id;


    public StuClass() {
    }

    public StuClass(String classId, String majorId, String id) {
        this.classId = classId;
        this.majorId = majorId;
        this.id = id;
    }

    public String getClassId() {
        return classId;
    }

    public void setClassId(String classId) {
        this.classId = classId;
    }

    public String getMajorId() {
        return majorId;
    }

    public void setMajorId(String majorId) {
        this.majorId = majorId;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}
