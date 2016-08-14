package com.busasst.dao;

import com.busasst.entity.RouteEntity;
import org.hibernate.SQLQuery;
import org.springframework.stereotype.Repository;
import org.hibernate.Query;

import java.util.List;

/**
 * Created by tsj on 16-8-12.
 */
@Repository("routeDao")
public class RouteDao extends BaseDao {
    public RouteEntity getById(int id) {
        return get(RouteEntity.class, id);
    }

    public List<RouteEntity> getAllRoutes() {
        String hql = "from RouteEntity as route";
        Query query = query(hql);
        List<RouteEntity> routes = query.list();
        return routes;
    }

    public int getMaxId(){
        System.out.println("routedaooooooooooooooooooo");
        String hql = "select max(route.rouId) from RouteEntity as route";
        Query query = query(hql);
        int maxid = (int)query.uniqueResult();
        System.out.println("maxid:--------------------->"+maxid);
        return maxid;
    }

    public void saveRoute(String name,int stationsum){
        RouteEntity route= new RouteEntity();
        route.setName(name);
        route.setStationSum(stationsum);
        save(route);
        getSession().flush();
        getSession().clear();
    }
}