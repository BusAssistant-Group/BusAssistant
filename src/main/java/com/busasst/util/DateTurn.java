package com.busasst.util;


import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

/**
 * Created by sl on 16-3-1.
 */
public class DateTurn {


    public static String String2Timestamp(Timestamp ts) {

        DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        return sdf.format(ts);

    }


    public static Timestamp Timestamp2String(String s){
        s += " 00:00:00.0";
        return Timestamp.valueOf(s);
    }




//    public static void main(String args[]){
//        Timestamp ts = new Timestamp(System.currentTimeMillis());
//
//        System.out.println(String2Timestamp(Timestamp2String("2016-08-12")));
//
//        System.out.println(Timestamp2String("2016-08-12"));
//
//    }



}
