package com.busasst.entity;

import javax.persistence.*;

/**
 * Created by sl on 16-8-14.
 */
@Entity
@Table(name = "driver", schema = "", catalog = "db_bus")
public class DriverEntity {
    private int driverId;
    private String name;
    private String driverLicense;
    private String sex;
    private Integer age;

    @Id
    @Column(name = "driver_id", nullable = false, insertable = true, updatable = true)
    public int getDriverId() {
        return driverId;
    }

    public void setDriverId(int driverId) {
        this.driverId = driverId;
    }

    @Basic
    @Column(name = "name", nullable = true, insertable = true, updatable = true, length = 255)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "driver_license", nullable = true, insertable = true, updatable = true, length = 255)
    public String getDriverLicense() {
        return driverLicense;
    }

    public void setDriverLicense(String driverLicense) {
        this.driverLicense = driverLicense;
    }

    @Basic
    @Column(name = "sex", nullable = true, insertable = true, updatable = true, length = 255)
    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    @Basic
    @Column(name = "age", nullable = true, insertable = true, updatable = true)
    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        DriverEntity that = (DriverEntity) o;

        if (driverId != that.driverId) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;
        if (driverLicense != null ? !driverLicense.equals(that.driverLicense) : that.driverLicense != null)
            return false;
        if (sex != null ? !sex.equals(that.sex) : that.sex != null) return false;
        if (age != null ? !age.equals(that.age) : that.age != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = driverId;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (driverLicense != null ? driverLicense.hashCode() : 0);
        result = 31 * result + (sex != null ? sex.hashCode() : 0);
        result = 31 * result + (age != null ? age.hashCode() : 0);
        return result;
    }
}
