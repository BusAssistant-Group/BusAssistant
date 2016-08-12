package com.busassistant.dao;

import com.busasst.dao.CarDao;
import com.busasst.entity.BusEntity;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.ContextHierarchy;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

/**
 * Created by sl on 16-8-12.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration(value = "src/main/webapp")
@ContextHierarchy({
        @ContextConfiguration(name = "parent", locations = "classpath*:conf/spring.xml"),
        @ContextConfiguration(name = "child", locations = "classpath*:conf/springmvc.xml")
})
public class CarDaoTest {
    @Autowired
    private CarDao carDao;

    @Test
    public void testBusExists(){
        Assert.assertTrue(carDao.exists("苏A15D34"));
    }

    @Test
    public void testGetByNumber(){
        BusEntity bus = carDao.getByNumber("苏A15D34");
        Assert.assertNotNull(bus);
    }

    @Test
    public void testUpdateByX(){

    }
}
