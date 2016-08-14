package com.busasst.dao;

import com.busasst.bean.SchedualBean;
import com.busasst.entity.BusEntity;
import com.busasst.entity.DriverEntity;
import com.busasst.entity.RouteEntity;
import com.busasst.entity.SchedualEntity;
import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by sl on 16-8-14.
 */
@Repository("schedualDao")
public class SchedualDao extends BaseDao{

    @Autowired
    private CarDao carDao;

    @Autowired
    private RouteDao routeDao;

    @Autowired
    private DriverDao driverDao;

    public List<SchedualBean> getDetaile(String date){

        List<SchedualBean> schedualBeans = new ArrayList<>();
        String hql = "from SchedualEntity as schedual where schedual.date='"+date+"'";
        Query query = query(hql);
        List<SchedualEntity> schedualEntities = query.list();

        for(SchedualEntity schedual : schedualEntities){
            System.out.println("schedual.getRouId():  "+schedual.getRouId());
            System.out.println("schedual.getDriverId():  "+schedual.getDriverId());
            System.out.println("schedual.getBusId():  "+schedual.getBusId());

            RouteEntity route = routeDao.getById(schedual.getRouId());
//            RouteEntity route = routeDao.getById(1);

            DriverEntity driver = driverDao.getById(schedual.getDriverId());
            BusEntity bus = carDao.getById(schedual.getBusId());

            System.out.println(bus.getNumber());
            System.out.println(schedual.getTime()+" "+date+" "+route.getStartStation());

            SchedualBean schedualBean = new SchedualBean(schedual.getTime(),date,route.getStartStation(),
                    driver.getName(),bus.getNumber(),route.getName(),bus.getSeatnum());

            schedualBeans.add(schedualBean);
        }

        return schedualBeans;

    }

}
