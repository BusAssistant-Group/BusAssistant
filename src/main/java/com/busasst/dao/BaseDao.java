package com.busasst.dao;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.Serializable;
import java.util.List;

/**
 * Created by CrazyCodess on 2016/4/27.
 */
public class BaseDao {
    @Autowired
    private SessionFactory sessionFactory;

    /**
     * 使用Spring的依赖注入
     * @param sessionFactory
     */
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    /**
     * 获取当前线程的session
     * 上下文相关的Session
     *
     *
     * @return
     */
    public Session getSession()
    {
        return sessionFactory.getCurrentSession();
    }

    /**
     * 查询得到一个列表
     * @param hql
     * @param params
     * @return
     */
    public List<?> queryForList(String hql, Object[] params)
    {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery(hql);
        if (params != null && params.length > 0)
        {
            for (int i = 0; i < params.length; i++)
            {
                query.setParameter(i, params[i]);
            }
        }
        return query.list();
    }

    /**
     * 查询得到一个对象,如果有多个则返回其中的第一个对象
     *
     * @param hql
     * @param params
     * @return
     */
    public Object queryForObject(String hql, Object[] params)
    {
        Query query = getSession().createQuery(hql);
        if (params != null && params.length > 0)
        {
            for (int i = 0; i < params.length; i++)
            {
                query.setParameter(i, params[i]);
            }
        }
        return query.uniqueResult();
    }

    /**
     * 查询得到指定类型的对象
     *
     * @param hql
     * @param clazz
     * @param params
     * @return
     */
    public <T> T queryForObject(String hql, Object[] params, Class<T> clazz)
    {
        Object result = this.queryForObject(hql, params);
        if (result == null)
        {
            return null;
        }
        else if (clazz.isInstance(result))
        {
            return clazz.cast(result);
        }
        else
        {
            throw new RuntimeException("Object:" + result + " cannot cast to " + clazz);
        }
    }

    /**
     * 更新一个对象
     *
     * @param object
     */
    public void update(Object object)
    {
        getSession().update(object);
    }

    /**
     * 保存一个对象
     *
     * @param object
     */
    public void save(Object object)
    {
        getSession().save(object);
    }

    /**
     *
     * 删除
     * @param object
     */
    public void delete(Object object){
        getSession().delete(object);
    }

    /**
     *
     * 保存或更新
     * @param object
     */
    public void saveOrUpdate(Object object){
        getSession().saveOrUpdate(object);
    }

    /**
     * get操作
     * @param arg0 类
     * @param arg1 主键
     * @return
     */
    public <T> T get(Class<?> arg0, Serializable arg1){
        return (T) getSession().get(arg0, arg1);
    }

    /**
     * 获取Query
     * @param hql
     * @return
     */
    public Query query(String hql){
        return getSession().createQuery(hql);
    }

    /**
     * 执行更新操作
     * @param hql
     * @param params
     * @return
     */
    public int executeUpdate(String hql, Object[] params)
    {
        Query query = getSession().createQuery(hql);
        if (params != null && params.length > 0)
        {
            for (int i = 0; i < params.length; i++)
            {
                query.setParameter(i, params[i]);
            }
        }
        return query.executeUpdate();
    }

    /**
     * 获取某个表的全部信息
     * @param entity 表对应实体的类名
     * @return 实体List
     */
    public <T> List<T> getAll(String entity){
        String string = "from " + entity;
        Query query = query(string);
        @SuppressWarnings("unchecked")
        List<T> ts = query.list();
        return ts;
    }

    public SQLQuery sqlQuery(String query){
        return getSession().createSQLQuery(query);
    }
}
