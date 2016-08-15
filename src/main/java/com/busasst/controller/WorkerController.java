package com.busasst.controller;

import com.busasst.bean.MessageStatus;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.io.FileUtils;
import com.busasst.dao.WorkerDao;
import com.busasst.util.ExcelReader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.List;
import java.util.Map;

/**
 * Created by sl on 16-8-2.
 */
@Controller
@RequestMapping("/worker")
public class WorkerController {


    @Autowired
    private WorkerDao workerDao;

    @RequestMapping("/list")
    public String list(Model model , HttpSession session){

        model.addAttribute("workers",workerDao.getAllWorker());
        session.setAttribute("activeId",1);
        return "workers-mng";
    }

    @RequestMapping(value = "/add" , method = RequestMethod.POST)
    public String addWorker(String name , int workerId , String dept ,
                                   String group , int routeId , int stationId){
        MessageStatus ms = workerDao.insert(workerId, routeId, stationId, name, dept, group);
        System.out.println("-----addWorker----- "+name+" "+dept);
        return "redirect:/worker/list";
    }



    @RequestMapping(value = "/update" , method = RequestMethod.POST)
    public String updateWorker(String name , int workerId , String dept ,
                            String group , int routeId , int stationId , int oldId){
        workerDao.updateWorker(oldId , name , workerId , dept , group , routeId , stationId);
        System.out.println("-----updateWorker----- "+name+" "+oldId);
        return "redirect:/worker/list";
    }


    @RequestMapping(value = "/delete/{id}" , method = RequestMethod.POST)
    public String deleteWorker(@PathVariable("id") int id){
        workerDao.deleteByX("workerId", String.valueOf(id));
        return "redirect:/worker/list";
    }


    @RequestMapping(value = "/addByFile" , method = RequestMethod.POST)
    public String addByFile(MultipartFile file){

        File file1 = new File("/home/sl/test/temp/"+file.getOriginalFilename());

        if(!file1.exists()){
            file1.mkdir();
        }else{
            file1.delete();
            file1.mkdir();
        }

        try {
            file.transferTo(file1);
        } catch (IOException e) {
            e.printStackTrace();
        }

        //获取表格的内容
        InputStream is = null;
        try {
            is = new FileInputStream(file1);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        ExcelReader excelReader = new ExcelReader();
        Map<Integer, String> map = excelReader.readExcelContent(is);
        for (int i = 1; i <= map.size(); i++) {
            System.out.println(map.get(i));
            String col = map.get(i);
            String[] words = col.split("    ");
            if(words.length<1){
                break;
            }
            workerDao.insert((int)Double.valueOf(words[1]).doubleValue() , (int)Double.valueOf(words[4]).doubleValue(),
                    (int)Double.valueOf(words[5]).doubleValue() , words[0] ,words[2] , words[3]);
        }

        return "redirect:/worker/list";
    }



}
