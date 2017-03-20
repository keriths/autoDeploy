package com.lyy.backend.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.BufferedReader;
import java.io.InputStreamReader;

/**
 * Created by fanshuai on 17/3/20.
 */
@Controller
public class DeployAction {

    @RequestMapping(value = "/autoDeploy")
    public String autoDeploy(String projectName,String ip,String tomcatHome){
        try {
            String cmdstring = "chmod a+x test.sh";
            Process proc = Runtime.getRuntime().exec(cmdstring);
            proc.waitFor(); //阻塞，直到上述命令执行完
            cmdstring = "bash test.sh"; //这里也可以是ksh等
            proc = Runtime.getRuntime().exec(cmdstring);
            // 注意下面的操作
            string ls_1;
            BufferedReader bufferedReader = new BufferedReader( new InputStreamReader(proc.getInputStream());
            while ( (ls_1=bufferedReader.readLine()) != null);
            bufferedReader.close();
            proc.waitFor();
        }catch (Exception e){

        }

    }
}
