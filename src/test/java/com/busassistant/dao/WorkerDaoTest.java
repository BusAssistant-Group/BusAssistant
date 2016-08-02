package com.busassistant.dao;

import com.busasst.bean.MessageStatus;
import com.busasst.dao.WorkerDao;
import com.busasst.entity.WorkerEntity;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.ContextHierarchy;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import java.util.List;

/**
 * Created by sl on 16-8-2.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration(value = "src/main/webapp")
@ContextHierarchy({
        @ContextConfiguration(name = "parent", locations = "classpath*:conf/spring.xml"),
        @ContextConfiguration(name = "child", locations = "classpath*:conf/springmvc.xml")
})
public class WorkerDaoTest {

    @Autowired
    private WorkerDao workerDao;

    @Test
    public void testExists(){
        Assert.assertTrue(workerDao.exists(1001));
    }

    @Test
    public void testInsert(){
        MessageStatus ms = workerDao.insert(1002,2,3,"Jack","采购部","采购部2组");
       // System.out.println("test5555555555: "+ms.getMessage());
        Assert.assertNotNull(ms);
        Assert.assertEquals(ms.getStatus(),1);
    }

    @Test
    public void testGetAll(){
        List<WorkerEntity> workers = workerDao.getAllWorker();
        Assert.assertNotNull(workers);
        for(WorkerEntity worker : workers){
            System.out.println(worker.getWorkerName()+" "+worker.getWorkerDept());
        }
    }

}
