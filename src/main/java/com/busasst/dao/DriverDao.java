package com.busasst.dao;

import com.busasst.entity.DriverEntity;
import org.springframework.stereotype.Repository;

/**
 * Created by sl on 16-8-14.
 */
@Repository("driverDao")
public class DriverDao extends BaseDao{

    public DriverEntity getById(int id){
        return get(DriverEntity.class,id);
    }

}
