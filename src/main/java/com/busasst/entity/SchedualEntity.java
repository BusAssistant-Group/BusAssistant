package com.busasst.entity;

import javax.persistence.*;

/**
 * Created by sl on 16-8-14.
 */
@Entity
@Table(name = "schedual", schema = "", catalog = "db_bus")
public class SchedualEntity {
    private int id;
    private Integer driverId;
    private Integer busId;
    private Integer rouId;
    private String time;
    private String date;

    @Id
    @Column(name = "id", nullable = false, insertable = true, updatable = true)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "driver_id", nullable = true, insertable = true, updatable = true)
    public Integer getDriverId() {
        return driverId;
    }

    public void setDriverId(Integer driverId) {
        this.driverId = driverId;
    }

    @Basic
    @Column(name = "bus_id", nullable = true, insertable = true, updatable = true)
    public Integer getBusId() {
        return busId;
    }

    public void setBusId(Integer busId) {
        this.busId = busId;
    }

    @Basic
    @Column(name = "rou_id", nullable = true, insertable = true, updatable = true)
    public Integer getRouId() {
        return rouId;
    }

    public void setRouId(Integer rouId) {
        this.rouId = rouId;
    }

    @Basic
    @Column(name = "time", nullable = true, insertable = true, updatable = true, length = 255)
    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    @Basic
    @Column(name = "date", nullable = true, insertable = true, updatable = true, length = 255)
    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        SchedualEntity that = (SchedualEntity) o;

        if (id != that.id) return false;
        if (driverId != null ? !driverId.equals(that.driverId) : that.driverId != null) return false;
        if (busId != null ? !busId.equals(that.busId) : that.busId != null) return false;
        if (rouId != null ? !rouId.equals(that.rouId) : that.rouId != null) return false;
        if (time != null ? !time.equals(that.time) : that.time != null) return false;
        if (date != null ? !date.equals(that.date) : that.date != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (driverId != null ? driverId.hashCode() : 0);
        result = 31 * result + (busId != null ? busId.hashCode() : 0);
        result = 31 * result + (rouId != null ? rouId.hashCode() : 0);
        result = 31 * result + (time != null ? time.hashCode() : 0);
        result = 31 * result + (date != null ? date.hashCode() : 0);
        return result;
    }
}
