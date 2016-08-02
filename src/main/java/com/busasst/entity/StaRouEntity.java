package com.busasst.entity;

import javax.persistence.*;

/**
 * Created by tsj on 16-7-5.
 */
@Entity
@Table(name = "sta_rou", schema = "", catalog = "db_bus")
public class StaRouEntity {
    private int srId;
    private Integer staId;
    private Integer rouId;

    public StaRouEntity(int srId, Integer staId, Integer rouId) {
        this.srId = srId;
        this.staId = staId;
        this.rouId = rouId;
    }

    public StaRouEntity(){

    }

    @Id
    @Column(name = "sr_id")
    public int getSrId() {
        return srId;
    }

    public void setSrId(int srId) {
        this.srId = srId;
    }

    @Basic
    @Column(name = "sta_id")
    public Integer getStaId() {
        return staId;
    }

    public void setStaId(Integer staId) {
        this.staId = staId;
    }

    @Basic
    @Column(name = "rou_id")
    public Integer getRouId() {
        return rouId;
    }

    public void setRouId(Integer rouId) {
        this.rouId = rouId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        StaRouEntity that = (StaRouEntity) o;

        if (srId != that.srId) return false;
        if (staId != null ? !staId.equals(that.staId) : that.staId != null) return false;
        if (rouId != null ? !rouId.equals(that.rouId) : that.rouId != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = srId;
        result = 31 * result + (staId != null ? staId.hashCode() : 0);
        result = 31 * result + (rouId != null ? rouId.hashCode() : 0);
        return result;
    }
}
