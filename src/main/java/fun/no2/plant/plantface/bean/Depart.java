package fun.no2.plant.plantface.bean;

import javax.persistence.Column;
import javax.persistence.Id;

public class Depart {
    @Id
    @Column
    private int departId;
    private String departName;

    public int getDepartId() {
        return departId;
    }

    public Depart() {
    }

    public void setDepartId(int departId) {
        this.departId = departId;
    }

    public String getDepartName() {
        return departName;
    }

    public void setDepartName(String departName) {
        this.departName = departName;
    }

    public Depart(int departId, String departName) {
        this.departId = departId;
        this.departName = departName;
    }
}
