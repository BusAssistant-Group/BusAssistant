package com.busasst.bean;

/**
 * Created by sl on 16-8-14.
 */
public class SchedualBean {

    private int id;
    private Integer driverId;
    private Integer busId;
    private Integer rouId;
    private String time;
    private String date;
    private String startStation;
    private String driverName;
    private String busNumber;
    private String routeName;

    public SchedualBean(String time, String date, String startStation,
                        String driverName, String busNumber, String routeName) {
        this.time = time;
        this.date = date;
        this.startStation = startStation;
        this.driverName = driverName;
        this.busNumber = busNumber;
        this.routeName = routeName;
    }

    public Integer getDriverId() {
        return driverId;
    }

    public void setDriverId(Integer driverId) {
        this.driverId = driverId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Integer getBusId() {
        return busId;
    }

    public void setBusId(Integer busId) {
        this.busId = busId;
    }

    public Integer getRouId() {
        return rouId;
    }

    public void setRouId(Integer rouId) {
        this.rouId = rouId;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getStartStation() {
        return startStation;
    }

    public void setStartStation(String startStation) {
        this.startStation = startStation;
    }

    public String getDriverName() {
        return driverName;
    }

    public void setDriverName(String driverName) {
        this.driverName = driverName;
    }

    public String getBusNumber() {
        return busNumber;
    }

    public void setBusNumber(String busNumber) {
        this.busNumber = busNumber;
    }

    public String getRouteName() {
        return routeName;
    }

    public void setRouteName(String routeName) {
        this.routeName = routeName;
    }
}
