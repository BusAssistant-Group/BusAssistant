package com.busasst.dao;

import com.busasst.entity.BusEntity;
import org.springframework.stereotype.Repository;

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

}
