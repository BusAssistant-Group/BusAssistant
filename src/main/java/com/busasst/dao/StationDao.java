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


}
