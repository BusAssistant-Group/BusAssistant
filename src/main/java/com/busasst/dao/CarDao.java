package com.busasst.dao;

import com.busasst.bean.MessageStatus;

import com.busasst.entity.BusEntity;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by sl on 16-8-11.
 */
@Repository("carDao")
public class CarDao extends BaseDao{

    public BusEntity getById(int carId){
        return get(BusEntity.class , carId);
    }

    public BusEntity getByNumber(String number){
        String hql = "from BusEntity as bus where bus.number='"+number+"'";
        Query query = query(hql);
        List<BusEntity> bus = query.list();
        return bus.get(0);
    }

    public List<BusEntity> getAll(){
        return getAll("BusEntity");
    }



    public void insert(String number, String brand, int seatnum, String registdate,
                                String  insurancedate, String vehiclelicense){

        BusEntity bus = new BusEntity(number,brand,Integer.valueOf(seatnum),registdate,insurancedate,vehiclelicense);

        if(!exists(number)){

          //  getSession().clear();
            save(bus);

            getSession().flush();
            getSession().clear();

//            getSession().flush();
            //getSession().merge(bus);
           // getSession().clear();
//            return new MessageStatus("添加成功！",1);
        }else {
           // getSession().refresh(bus);
        }
//        return new MessageStatus("该员工已存在！",0);
    }


    public boolean exists(String number){
        String hql = "from BusEntity as bus where bus.number='"+number+"'";
        Query query = query(hql);
        List<BusEntity> bus = query.list();
        if(bus.isEmpty()){
            return false;
        }
        return true;
    }


    public void deleteByX(String key,String value){
        String hql = "delete BusEntity bus where bus."+key+"="+value;
        Query query = query(hql);
        query.executeUpdate();
    }


    public void updateX(String column,String oldvalue , String key , String value){
        String hql;
        if(key.equals("seatnum")){
            hql = "update BusEntity bus set bus."+key+"="+value+" where bus."+column+"='"+oldvalue+"'";
        }else{
            hql = "update BusEntity bus set bus."+key+"='"+value+"' where bus."+column+"='"+oldvalue+"'";
        }
        Query query = query(hql);
        query.executeUpdate();
    }

    public void updateCar(String number, String brand, Integer seatnum, String registdate,
                          String  insurancedate, String vehiclelicense , String oldNumber){
        BusEntity bus = getByNumber(oldNumber);

        if(!bus.getNumber().equals(number)) {
            updateX("number", number, "number", number);
        }

        if(!bus.getBrand().equals(brand)) {
            updateX("number", number, "brand", brand);
        }

        if(bus.getSeatnum()!=(seatnum)) {
            updateX("number", number, "seatnum", String.valueOf(seatnum));
        }

        if(!bus.getInsurancedate().equals(insurancedate)) {
            updateX("number", number, "insurancedate", insurancedate);
        }

        if(!bus.getVehiclelicense().equals(vehiclelicense)) {
            updateX("number", number, "vehiclelicense", vehiclelicense);
        }

        if(!bus.getRegistdate().equals(registdate)) {
            updateX("number", number, "registdate", registdate);
            System.out.println("修改！！！！！  "+ registdate);
        }


    }
}
