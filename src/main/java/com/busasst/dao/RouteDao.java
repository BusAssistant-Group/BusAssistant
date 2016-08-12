package com.busasst.dao;

import com.busasst.entity.RouteEntity;
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
}