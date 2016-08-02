//package com.busasst.dao;
//
//import com.busasst.bean.WorkerEntity;
//import org.junit.Assert;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Qualifier;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.ContextHierarchy;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//import org.springframework.test.context.web.WebAppConfiguration;
//
//import javax.annotation.Resource;
//import java.util.List;
//
///**
// * Created by tsj on 16-7-6.
// */
//
//@RunWith(SpringJUnit4ClassRunner.class)
//@WebAppConfiguration(value = "src/main/webapp")
//@ContextHierarchy({
//        @ContextConfiguration(name = "parent", locations = "classpath*:conf/spring.xml"),
//        @ContextConfiguration(name = "child", locations = "classpath*:conf/springmvc.xml")
//})
//public class TestWorkerDao {
//
//    @Autowired
//    @Qualifier("workerDao")
//    WorkerDao workerDao;
//
//    @Test
//    public void testInsert(){
//        workerDao.insert(10001,20002,30003,"zhangsan","develop","123");
//    }
//}
