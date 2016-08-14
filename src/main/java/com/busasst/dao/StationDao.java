package com.busasst.dao;

import com.busasst.entity.AdminEntity;
import com.busasst.entity.StaRouEntity;
import com.busasst.entity.StationEntity;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;


import javax.validation.constraints.AssertFalse;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2016/8/12.
 */
@Repository("stationDao")
public class StationDao extends BaseDao{
    public StationEntity getById(int userid){
        return get(StationEntity.class,userid);
    }

    public void saveSation(String lonlat){
        StationEntity station = new StationEntity();
        System.out.println("stationdao");
        station.setLongla(lonlat);
        System.out.println("middle");
        save(station);
        getSession().flush();
        getSession().clear();
        System.out.println("end stationdao");
    }

    public int getMaxId(){
        String hql = "select max(station.staId) from StationEntity as station";
        Query query = query(hql);
        int maxid = (int)query.uniqueResult();
        System.out.println("maxid:--------------------->"+maxid);
        return maxid;
    }

}
