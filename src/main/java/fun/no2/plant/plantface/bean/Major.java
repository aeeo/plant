package fun.no2.plant.plantface.bean;

import javax.persistence.Column;

public class Major {
    @Column
    private int majorId;
    private String majorName;
    private String majorDepartId;

    public Major(int majorId, String majorName, String majorDepartId) {
        this.majorId = majorId;
        this.majorName = majorName;
        this.majorDepartId = majorDepartId;
    }
    public Major() {
    }

    public int getMajorId() {
        return majorId;
    }

    public void setMajorId(int majorId) {
        this.majorId = majorId;
    }

    public String getMajorName() {
        return majorName;
    }

    public void setMajorName(String majorName) {
        this.majorName = majorName;
    }

    public String getMajorDepartId() {
        return majorDepartId;
    }

    public void setMajorDepartId(String majorDepartId) {
        this.majorDepartId = majorDepartId;
    }


}

