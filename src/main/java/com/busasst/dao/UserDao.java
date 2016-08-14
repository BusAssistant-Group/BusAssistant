package com.busasst.dao;

import com.busasst.entity.AdminEntity;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by tsj on 16-8-10.
 */
@Repository("userDao")
public class UserDao extends BaseDao {
    public AdminEntity getById(int userid){
        return get(AdminEntity.class,userid);
    }
    public void save(String userName , String password ){
        AdminEntity user = new AdminEntity();
        user.setUsername(userName);
        user.setPassword(password);
        user.setAuthority(0);
        save(user);
    }
    public AdminEntity getByName(String userName){
        String hql = "from AdminEntity as user where user.username=?";
        Query query = query(hql);
        query.setString(0,userName);
        List<AdminEntity> member = query.list();
        if(member.isEmpty())return null;
        else return member.get(0);
    }

    public List<AdminEntity> getAllUsers(){
        String hql = "from AdminEntity";
        Query query = query(hql);
        List<AdminEntity> users = query.list();
        return users;
    }

    public void updateById(int id,int level){
        String hql = "update AdminEntity admin set admin.authority=? where adminId=?";
        Query query = query(hql);
        query.setInteger(0,level);
        query.setInteger(1,id);
        query.executeUpdate();
    }
}
