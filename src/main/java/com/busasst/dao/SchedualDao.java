package com.busasst.dao;

import com.busasst.bean.SchedualBean;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by sl on 16-8-14.
 */
@Repository("schedualDao")
public class SchedualDao extends BaseDao{

    public List<SchedualBean> getDetaile(String date){

        String hql = "from SchedualEntity as schedual where schedual.date='"+date+"'";
        Query query = query(hql);
        return query.list();

    }

}
