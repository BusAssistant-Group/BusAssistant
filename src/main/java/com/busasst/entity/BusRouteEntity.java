package com.busasst.entity;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by tsj on 16-7-5.
 */
@Entity
@Table(name = "bus_route", schema = "", catalog = "db_bus")
public class BusRouteEntity {
    private int brId;
    private Integer busId;
    private Integer rouId;
    private Timestamp time;

    public BusRouteEntity(int brId, Integer busId, Integer rouId, Timestamp time) {
        this.brId = brId;
        this.busId = busId;
        this.rouId = rouId;
        this.time = time;
    }

    public BusRouteEntity(){

    }

    @Id
    @Column(name = "br_id")
    public int getBrId() {
        return brId;
    }

    public void setBrId(int brId) {
        this.brId = brId;
    }

    @Basic
    @Column(name = "bus_id")
    public Integer getBusId() {
        return busId;
    }

    public void setBusId(Integer busId) {
        this.busId = busId;
    }

    @Basic
    @Column(name = "rou_id")
    public Integer getRouId() {
        return rouId;
    }

    public void setRouId(Integer rouId) {
        this.rouId = rouId;
    }

    @Basic
    @Column(name = "time")
    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        BusRouteEntity that = (BusRouteEntity) o;

        if (brId != that.brId) return false;
        if (busId != null ? !busId.equals(that.busId) : that.busId != null) return false;
        if (rouId != null ? !rouId.equals(that.rouId) : that.rouId != null) return false;
        if (time != null ? !time.equals(that.time) : that.time != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = brId;
        result = 31 * result + (busId != null ? busId.hashCode() : 0);
        result = 31 * result + (rouId != null ? rouId.hashCode() : 0);
        result = 31 * result + (time != null ? time.hashCode() : 0);
        return result;
    }
}
