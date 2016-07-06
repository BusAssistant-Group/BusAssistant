package com.busasst.bean;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by tsj on 16-7-5.
 */
@Entity
@Table(name = "bus", schema = "", catalog = "db_bus")
public class BusEntity {
    private int busId;
    private Integer number;
    private String brand;
    private Integer seatnum;
    private Timestamp registdate;
    private Timestamp insurancedate;
    private String drivelicense;
    private String vehiclelicense;

    public BusEntity(int busId, Integer number, String brand, Integer seatnum, Timestamp registdate, Timestamp insurancedate, String drivelicense, String vehiclelicense) {
        this.busId = busId;
        this.number = number;
        this.brand = brand;
        this.seatnum = seatnum;
        this.registdate = registdate;
        this.insurancedate = insurancedate;
        this.drivelicense = drivelicense;
        this.vehiclelicense = vehiclelicense;
    }

    public BusEntity(){

    }

    @Id
    @Column(name = "bus_id")
    public int getBusId() {
        return busId;
    }

    public void setBusId(int busId) {
        this.busId = busId;
    }

    @Basic
    @Column(name = "number")
    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    @Basic
    @Column(name = "brand")
    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    @Basic
    @Column(name = "seatnum")
    public Integer getSeatnum() {
        return seatnum;
    }

    public void setSeatnum(Integer seatnum) {
        this.seatnum = seatnum;
    }

    @Basic
    @Column(name = "registdate")
    public Timestamp getRegistdate() {
        return registdate;
    }

    public void setRegistdate(Timestamp registdate) {
        this.registdate = registdate;
    }

    @Basic
    @Column(name = "insurancedate")
    public Timestamp getInsurancedate() {
        return insurancedate;
    }

    public void setInsurancedate(Timestamp insurancedate) {
        this.insurancedate = insurancedate;
    }

    @Basic
    @Column(name = "drivelicense")
    public String getDrivelicense() {
        return drivelicense;
    }

    public void setDrivelicense(String drivelicense) {
        this.drivelicense = drivelicense;
    }

    @Basic
    @Column(name = "vehiclelicense")
    public String getVehiclelicense() {
        return vehiclelicense;
    }

    public void setVehiclelicense(String vehiclelicense) {
        this.vehiclelicense = vehiclelicense;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        BusEntity busEntity = (BusEntity) o;

        if (busId != busEntity.busId) return false;
        if (number != null ? !number.equals(busEntity.number) : busEntity.number != null) return false;
        if (brand != null ? !brand.equals(busEntity.brand) : busEntity.brand != null) return false;
        if (seatnum != null ? !seatnum.equals(busEntity.seatnum) : busEntity.seatnum != null) return false;
        if (registdate != null ? !registdate.equals(busEntity.registdate) : busEntity.registdate != null) return false;
        if (insurancedate != null ? !insurancedate.equals(busEntity.insurancedate) : busEntity.insurancedate != null)
            return false;
        if (drivelicense != null ? !drivelicense.equals(busEntity.drivelicense) : busEntity.drivelicense != null)
            return false;
        if (vehiclelicense != null ? !vehiclelicense.equals(busEntity.vehiclelicense) : busEntity.vehiclelicense != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = busId;
        result = 31 * result + (number != null ? number.hashCode() : 0);
        result = 31 * result + (brand != null ? brand.hashCode() : 0);
        result = 31 * result + (seatnum != null ? seatnum.hashCode() : 0);
        result = 31 * result + (registdate != null ? registdate.hashCode() : 0);
        result = 31 * result + (insurancedate != null ? insurancedate.hashCode() : 0);
        result = 31 * result + (drivelicense != null ? drivelicense.hashCode() : 0);
        result = 31 * result + (vehiclelicense != null ? vehiclelicense.hashCode() : 0);
        return result;
    }
}
