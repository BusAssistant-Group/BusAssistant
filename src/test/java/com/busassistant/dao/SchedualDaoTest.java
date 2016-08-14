package com.busassistant.dao;

/**
 * Created by sl on 16-8-14.
 */

import com.busasst.bean.SchedualBean;
import com.busasst.dao.RouteDao;
import com.busasst.dao.SchedualDao;
import javafx.scene.control.Alert;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.ContextHierarchy;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration(value = "src/main/webapp")
@ContextHierarchy({
        @ContextConfiguration(name = "parent", locations = "classpath*:conf/spring.xml"),
        @ContextConfiguration(name = "child", locations = "classpath*:conf/springmvc.xml")
})
public class SchedualDaoTest {

    @Autowired
    private SchedualDao schedualDao;

    @Autowired
    private RouteDao routeDao;

    @Test
    public void testGetDetaile(){
        List<SchedualBean> list = schedualDao.getDetaile("2014-08-1");
        Assert.assertNotNull(list);
    }


    @Test
    public void testRouteById(){
        Assert.assertNotNull(routeDao.getById(1));
    }

}
