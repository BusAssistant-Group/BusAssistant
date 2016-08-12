package com.busasst.entity;

import javax.persistence.*;

/**
 * Created by sl on 16-8-12.
 */
@Entity
@Table(name = "bus", schema = "", catalog = "db_bus")
public class BusEntity {
    private int busId;
    private String number;
    private String brand;
    private Integer seatnum;
    private String registdate;
    private String insurancedate;
    private String vehiclelicense;

    public BusEntity(){

    }

    public BusEntity(String number, String brand, Integer seatnum,
                     String registdate, String insurancedate, String vehiclelicense) {
        this.number = number;
        this.brand = brand;
        this.seatnum = seatnum;
        this.registdate = registdate;
        this.insurancedate = insurancedate;
        this.vehiclelicense = vehiclelicense;
    }

    @Id
    @Column(name = "bus_id", nullable = false, insertable = true, updatable = true)
    public int getBusId() {
        return busId;
    }

    public void setBusId(int busId) {
        this.busId = busId;
    }

    @Basic
    @Column(name = "number", nullable = true, insertable = true, updatable = true, length = 100)
    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    @Basic
    @Column(name = "brand", nullable = true, insertable = true, updatable = true, length = 100)
    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    @Basic
    @Column(name = "seatnum", nullable = true, insertable = true, updatable = true)
    public Integer getSeatnum() {
        return seatnum;
    }

    public void setSeatnum(Integer seatnum) {
        this.seatnum = seatnum;
    }

    @Basic
    @Column(name = "registdate", nullable = true, insertable = true, updatable = true, length = 100)
    public String getRegistdate() {
        return registdate;
    }

    public void setRegistdate(String registdate) {
        this.registdate = registdate;
    }

    @Basic
    @Column(name = "insurancedate", nullable = true, insertable = true, updatable = true, length = 100)
    public String getInsurancedate() {
        return insurancedate;
    }

    public void setInsurancedate(String insurancedate) {
        this.insurancedate = insurancedate;
    }

    @Basic
    @Column(name = "vehiclelicense", nullable = true, insertable = true, updatable = true, length = 100)
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
        result = 31 * result + (vehiclelicense != null ? vehiclelicense.hashCode() : 0);
        return result;
    }
}
