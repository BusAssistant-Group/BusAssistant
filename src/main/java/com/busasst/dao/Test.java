package com.busasst.dao;

import com.busasst.entity.BusEntity;
import org.hibernate.Query;

import java.util.List;

/**
 * Created by sl on 16-8-12.
 */
public class Test extends BaseDao{
    public static void main(String args[]){
       // CarDao carDao = new CarDao();
        Test test = new Test();
        // BusEntity bus = carDao.getByNumber("苏A12B34");
        // System.out.println(bus.getBrand());
        System.out.println(test.exists(" "));
        System.out.println("***");
    }
    public  boolean exists(String number){
        //  String hql = "from BusEntity as bus where bus.brand='"+number+"'";
        String hql = "from BusEntity";
        Query query = query(hql);
        List<BusEntity> bus = query.list();
        if(bus.isEmpty()){
            return false;
        }
        return true;
    }
}
