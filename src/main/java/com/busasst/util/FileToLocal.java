package com.busasst.util;

import org.apache.commons.fileupload.disk.DiskFileItem;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

/**
 * Created by sl on 16-8-13.
 */
public class FileToLocal {

    public void test(){

        String col = "Jack    男    12.0    12.0    33.5    21.0    44.0    娃娃";
        String[] words = col.split("    ");
        for(String s : words){
            if(!s.equals(" "))
                System.out.println(s);
        }
    }

    public static void main(String args[]){
        FileToLocal fileToLocal = new FileToLocal();
        fileToLocal.test();
    }

}
