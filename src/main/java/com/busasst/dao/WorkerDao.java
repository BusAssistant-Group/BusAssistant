package com.busasst.dao;

import com.busasst.bean.MessageStatus;
import com.busasst.entity.WorkerEntity;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import java.util.List;


/**
 * Created by tsj on 16-7-6.
 */
@Repository("workDao")
public class WorkerDao extends BaseDao {

    /**
     * @param id 当前对象的主键
     * @return workerEntity对象
     */
    public WorkerEntity getById(int id){
        return get(WorkerEntity.class,id);
    }


    /**
     * WorkerEntity的全部属性
     * @param workerId
     * @param rouId
     * @param staId
     * @param name
     * @param dept
     * @param group
     */
    public MessageStatus insert(int workerId, int rouId, int staId, String name, String dept, String group){
        if(!exists(workerId)){
            WorkerEntity workerEntity = new WorkerEntity(workerId,Integer.valueOf(rouId),
                    Integer.valueOf(staId),name,dept,group);

            save(workerEntity);
            return new MessageStatus("添加成功！",1);
        }

        return new MessageStatus("该员工已存在！",0);
    }




    public boolean exists(int workerId){
        String hql = "from WorkerEntity as worker " +
                "where worker.workerId="+workerId;
        Query query = query(hql);
        if(query.list().isEmpty()){
            return false;
        }
        return true;
    }



    /**
     * 通过某列等于某值来定位一条记录
     * @param key 字段名
     * @param value 字段值
     */
    public  void deleteByX(String key,String value){
        String hql = "delete WorkerEntity worker where worker."+key+"="+value;
        Query query = query(hql);
        query.executeUpdate();
    }


    /**
     * @param key 要更新的字段
     * @param value 要更新的字段值
     * @param column 筛选条件字段
     * @param oldvalue 筛选条件字段值
     */
    public void updateX(String column,String oldvalue , String key , String value){
        String hql;
        if(key.equals("workerName") || key.equals("group")){
            hql = "update WorkerEntity worker set worker."+key+"='"+value+"' where worker."+column+"="+oldvalue;
        }else {
            hql = "update WorkerEntity worker set worker."+key+"="+value+" where worker."+column+"="+oldvalue;
        }
        Query query = query(hql);
        query.executeUpdate();
    }


    public void updateWorker(int oldId , String name , int workerId , String dept ,
                             String group , int routeId , int stationId){
        WorkerEntity worker = getById(oldId);
        if(!worker.getWorkerName().equals(name)) {
            updateX("workerId", String.valueOf(oldId), "workerName", name);
            System.out.println("change "+name);
        }

        if(!worker.getWorkerDept().equals(dept)) {
            updateX("workerId", String.valueOf(oldId), "workerDept", dept);
            System.out.println("change " + dept);
        }

        if(!worker.getWorkerGroup().equals(group)) {
            updateX("workerId", String.valueOf(oldId), "workerGroup", group);
            System.out.println("change " + group);
        }

        if(worker.getStaId() != stationId) {
            updateX("workerId", String.valueOf(oldId), "staId", String.valueOf(stationId));
            System.out.println("change "+stationId);
        }

        if(worker.getRouId() != routeId) {
            updateX("workerId", String.valueOf(oldId), "rouId", String.valueOf(routeId));
            System.out.println("change " + routeId);
        }

        if(worker.getWorkerId() != workerId) {
            updateX("workerId", String.valueOf(oldId), "workerId", String.valueOf(workerId));
            System.out.println("change "+workerId);
        }

    }


    /**
     * @param key 筛选条件字段
     * @param value 筛选条件字段值
     * @return 查询得到的该对象组成的list
     */
    public List<WorkerEntity> getByX(String key,String value){
        String hql = "from WorkerEntity as worker where worker."+key+"=?";
        Query query = query(hql);
        query.setString(0, value);
        List<WorkerEntity> results = query.list();
        return results;
    }


    public List<WorkerEntity> getAllWorker(){
        return getAll("WorkerEntity");
    }
}
