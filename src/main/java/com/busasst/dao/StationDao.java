package com.busasst.dao;

import com.busasst.entity.AdminEntity;
import com.busasst.entity.StationEntity;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;


import javax.validation.constraints.AssertFalse;
import java.util.List;

/**
 * Created by Administrator on 2016/8/12.
 */
@Repository("stationDao")
public class StationDao extends BaseDao{
    public StationEntity getById(int userid){
        return get(StationEntity.class,userid);
    }

    public List<StationEntity> getAllStationsById(int id){
        String hql = "from StationEntity ";
        Query query = query(hql);
        List<StationEntity> stations = query.list();
        return stations;
    }
}
