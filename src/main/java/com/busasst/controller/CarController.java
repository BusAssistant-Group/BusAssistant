package com.busasst.controller;

import com.busasst.bean.MessageStatus;
import com.busasst.dao.CarDao;
import com.busasst.util.DateTurn;
import com.busasst.util.ExcelReader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.*;
import java.sql.Timestamp;
import java.util.Map;

/**
 * Created by sl on 16-8-11.
 */
@Controller
@RequestMapping("/car")
public class CarController {

    @Autowired
    private CarDao carDao;

    @RequestMapping("/list")
    public String list(Model model , HttpSession session){
        session.setAttribute("activeId",2);
        model.addAttribute("cars",carDao.getAll());
        return "cars-mng";
    }

    @RequestMapping(value = "/add" , method = RequestMethod.POST)
    public String addCar(String number, String brand, int seatnum, String registdate,
                         String  insurancedate, String vehiclelicense){
        carDao.insert(number,brand,seatnum,registdate,insurancedate,vehiclelicense);
        return "redirect:/car/list";
    }

    @RequestMapping(value = "/delete/{busId}" , method = RequestMethod.POST)
    public String deleteCar(@PathVariable("busId") int busId){
        carDao.deleteByX("busId",String.valueOf(busId));
        return "redirect:/car/list";
    }


    @RequestMapping(value = "/update" , method = RequestMethod.POST)
    public String updateCar(String number, String brand, int seatnum, String registdate,
                            String insurancedate, String vehiclelicense , String oldNumber){

        carDao.updateCar(number,brand,Integer.valueOf(seatnum),registdate,insurancedate,
                        vehiclelicense,oldNumber);
        return "redirect:/car/list";
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
            System.out.println("test::::::"+words[0]);
            carDao.insert(words[0],words[1],(int)Double.valueOf(words[2]).doubleValue(),
                    words[3],words[4],words[5]);
        }

        return "redirect:/car/list";
    }



}
