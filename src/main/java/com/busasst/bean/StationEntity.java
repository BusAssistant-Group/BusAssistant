package com.busasst.bean;

import javax.persistence.*;

/**
 * Created by tsj on 16-7-5.
 */
@Entity
@Table(name = "station", schema = "", catalog = "db_bus")
public class StationEntity {
    private int staId;
    private String name;
    private Integer wokerSum;
    private Integer routeSum;
    private String longla;
    private String address;

    @Id
    @Column(name = "sta_id")
    public int getStaId() {
        return staId;
    }

    public void setStaId(int staId) {
        this.staId = staId;
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
    @Column(name = "woker_sum")
    public Integer getWokerSum() {
        return wokerSum;
    }

    public void setWokerSum(Integer wokerSum) {
        this.wokerSum = wokerSum;
    }

    @Basic
    @Column(name = "route_sum")
    public Integer getRouteSum() {
        return routeSum;
    }

    public void setRouteSum(Integer routeSum) {
        this.routeSum = routeSum;
    }

    @Basic
    @Column(name = "longla")
    public String getLongla() {
        return longla;
    }

    public void setLongla(String longla) {
        this.longla = longla;
    }

    @Basic
    @Column(name = "address")
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        StationEntity that = (StationEntity) o;

        if (staId != that.staId) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;
        if (wokerSum != null ? !wokerSum.equals(that.wokerSum) : that.wokerSum != null) return false;
        if (routeSum != null ? !routeSum.equals(that.routeSum) : that.routeSum != null) return false;
        if (longla != null ? !longla.equals(that.longla) : that.longla != null) return false;
        if (address != null ? !address.equals(that.address) : that.address != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = staId;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (wokerSum != null ? wokerSum.hashCode() : 0);
        result = 31 * result + (routeSum != null ? routeSum.hashCode() : 0);
        result = 31 * result + (longla != null ? longla.hashCode() : 0);
        result = 31 * result + (address != null ? address.hashCode() : 0);
        return result;
    }
}
