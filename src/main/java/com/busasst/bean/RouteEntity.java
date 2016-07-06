package com.busasst.bean;

import javax.persistence.*;

/**
 * Created by tsj on 16-7-5.
 */
@Entity
@Table(name = "route", schema = "", catalog = "db_bus")
public class RouteEntity {
    private int rouId;
    private String name;
    private Integer workerSum;
    private Integer stationSum;
    private Double riderate;
    private String distance;

    public RouteEntity(int rouId, String name, Integer workerSum, Integer stationSum, Double riderate, String distance) {
        this.rouId = rouId;
        this.name = name;
        this.workerSum = workerSum;
        this.stationSum = stationSum;
        this.riderate = riderate;
        this.distance = distance;
    }

    public RouteEntity(){

    }

    @Id
    @Column(name = "rou_id")
    public int getRouId() {
        return rouId;
    }

    public void setRouId(int rouId) {
        this.rouId = rouId;
    }

    @Basic
    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "worker_sum")
    public Integer getWorkerSum() {
        return workerSum;
    }

    public void setWorkerSum(Integer workerSum) {
        this.workerSum = workerSum;
    }

    @Basic
    @Column(name = "station_sum")
    public Integer getStationSum() {
        return stationSum;
    }

    public void setStationSum(Integer stationSum) {
        this.stationSum = stationSum;
    }

    @Basic
    @Column(name = "riderate")
    public Double getRiderate() {
        return riderate;
    }

    public void setRiderate(Double riderate) {
        this.riderate = riderate;
    }

    @Basic
    @Column(name = "distance")
    public String getDistance() {
        return distance;
    }

    public void setDistance(String distance) {
        this.distance = distance;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        RouteEntity that = (RouteEntity) o;

        if (rouId != that.rouId) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;
        if (workerSum != null ? !workerSum.equals(that.workerSum) : that.workerSum != null) return false;
        if (stationSum != null ? !stationSum.equals(that.stationSum) : that.stationSum != null) return false;
        if (riderate != null ? !riderate.equals(that.riderate) : that.riderate != null) return false;
        if (distance != null ? !distance.equals(that.distance) : that.distance != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = rouId;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (workerSum != null ? workerSum.hashCode() : 0);
        result = 31 * result + (stationSum != null ? stationSum.hashCode() : 0);
        result = 31 * result + (riderate != null ? riderate.hashCode() : 0);
        result = 31 * result + (distance != null ? distance.hashCode() : 0);
        return result;
    }
}
