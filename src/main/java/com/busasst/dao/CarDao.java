package com.busasst.dao;

import com.busasst.bean.MessageStatus;
import com.busasst.entity.BusEntity;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import java.sql.Timestamp;
import java.util.List;

/**
 * Created by sl on 16-8-11.
 */
@Repository("carDao")
public class CarDao extends BaseDao{

    public BusEntity getById(int carId){
        return get(BusEntity.class , carId);
    }

    public List<BusEntity> getAll(){
        return getAll("BusEntity");
    }



    public MessageStatus insert(String number, String brand, Integer seatnum, Timestamp registdate,
                                Timestamp insurancedate, String vehiclelicense){
        if(!exists(number)){
            BusEntity bus = new BusEntity(number,brand,seatnum,registdate,insurancedate,vehiclelicense);
            save(bus);
            return new MessageStatus("添加成功！",1);
        }
        return new MessageStatus("该员工已存在！",0);
    }


    private boolean exists(String number){
        String hql = "from BusEntity as bus " +
                "where bus.number="+number;
        Query query = query(hql);
        if(query.list().isEmpty()){
            return false;
        }
        return true;
    }


    public void deleteByX(String key,String value){
        String hql = "delete BusEntity bus where bus."+key+"="+value;
        Query query = query(hql);
        query.executeUpdate();
    }
}
