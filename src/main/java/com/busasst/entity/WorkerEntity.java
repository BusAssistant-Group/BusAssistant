package com.busasst.entity;

import javax.persistence.*;

/**
 * Created by sl on 16-8-2.
 */
@Entity
@Table(name = "worker", schema = "", catalog = "db_bus")
public class WorkerEntity {
    private int workerId;
    private Integer rouId;
    private Integer staId;
    private String workerName;
    private String workerDept;
    private String workerGroup;

    public WorkerEntity(int workerId, Integer rouId, Integer staId, String workerName, String workerDept, String workerGroup) {
        this.workerId = workerId;
        this.rouId = rouId;
        this.staId = staId;
        this.workerName = workerName;
        this.workerDept = workerDept;
        this.workerGroup = workerGroup;
    }

    public WorkerEntity() {
    }

    @Id
    @Column(name = "worker_id", nullable = false, insertable = true, updatable = true)
    public int getWorkerId() {
        return workerId;
    }

    public void setWorkerId(int workerId) {
        this.workerId = workerId;
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
    @Column(name = "sta_id", nullable = true, insertable = true, updatable = true)
    public Integer getStaId() {
        return staId;
    }

    public void setStaId(Integer staId) {
        this.staId = staId;
    }

    @Basic
    @Column(name = "worker_name", nullable = true, insertable = true, updatable = true, length = 100)
    public String getWorkerName() {
        return workerName;
    }

    public void setWorkerName(String workerName) {
        this.workerName = workerName;
    }

    @Basic
    @Column(name = "worker_dept", nullable = true, insertable = true, updatable = true, length = 100)
    public String getWorkerDept() {
        return workerDept;
    }

    public void setWorkerDept(String workerDept) {
        this.workerDept = workerDept;
    }

    @Basic
    @Column(name = "worker_group", nullable = true, insertable = true, updatable = true, length = 100)
    public String getWorkerGroup() {
        return workerGroup;
    }

    public void setWorkerGroup(String workerGroup) {
        this.workerGroup = workerGroup;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        WorkerEntity that = (WorkerEntity) o;

        if (workerId != that.workerId) return false;
        if (rouId != null ? !rouId.equals(that.rouId) : that.rouId != null) return false;
        if (staId != null ? !staId.equals(that.staId) : that.staId != null) return false;
        if (workerName != null ? !workerName.equals(that.workerName) : that.workerName != null) return false;
        if (workerDept != null ? !workerDept.equals(that.workerDept) : that.workerDept != null) return false;
        if (workerGroup != null ? !workerGroup.equals(that.workerGroup) : that.workerGroup != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = workerId;
        result = 31 * result + (rouId != null ? rouId.hashCode() : 0);
        result = 31 * result + (staId != null ? staId.hashCode() : 0);
        result = 31 * result + (workerName != null ? workerName.hashCode() : 0);
        result = 31 * result + (workerDept != null ? workerDept.hashCode() : 0);
        result = 31 * result + (workerGroup != null ? workerGroup.hashCode() : 0);
        return result;
    }
}
