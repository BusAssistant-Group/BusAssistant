package com.busasst.dao;

import com.busasst.entity.StaRouEntity;
import com.busasst.entity.StationEntity;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by tsj on 16-8-12.
 */
@Repository("starouDao")
public class StaRouDao extends BaseDao{
    public StaRouEntity getById(int id){
        return get(StaRouEntity.class,id);
    }

    public List<StaRouEntity> getAllStationsById(int id){
        String hql = "from StaRouEntity as sr where sr.rouId=?";
        Query query = query(hql);
        query.setInteger(0,id);
        List<StaRouEntity> temp = query.list();
        return temp;
    }

    public void saveStaRou(int staid,int rouid){
        StaRouEntity starou = new StaRouEntity();
        starou.setRouId(rouid);
        starou.setStaId(staid);
        save(starou);
        getSession().flush();
        getSession().clear();
    }
}
