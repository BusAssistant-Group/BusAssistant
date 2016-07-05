package com.busasst.bean;

import javax.persistence.*;

/**
 * Created by tsj on 16-7-5.
 */
@Entity
@Table(name = "worker", schema = "", catalog = "db_bus")
public class WorkerEntity {
    private int workerId;
    private Integer rouId;
    private Integer staId;

    @Id
    @Column(name = "worker_id")
    public int getWorkerId() {
        return workerId;
    }

    public void setWorkerId(int workerId) {
        this.workerId = workerId;
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
    @Column(name = "sta_id")
    public Integer getStaId() {
        return staId;
    }

    public void setStaId(Integer staId) {
        this.staId = staId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        WorkerEntity that = (WorkerEntity) o;

        if (workerId != that.workerId) return false;
        if (rouId != null ? !rouId.equals(that.rouId) : that.rouId != null) return false;
        if (staId != null ? !staId.equals(that.staId) : that.staId != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = workerId;
        result = 31 * result + (rouId != null ? rouId.hashCode() : 0);
        result = 31 * result + (staId != null ? staId.hashCode() : 0);
        return result;
    }
}
