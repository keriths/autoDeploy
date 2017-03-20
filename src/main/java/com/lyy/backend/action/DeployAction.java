package com.lyy.backend.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.BufferedReader;
import java.io.InputStreamReader;

/**
 * Created by fanshuai on 17/3/20.
 */
@Controller("/backend/deploy/")
public class DeployAction {

    @RequestMapping(value = "/autoDeploy")
    public String autoDeploy(){
        try {

        }catch (Exception e){

        }
        return "/backend/deploy";
    }

    @RequestMapping(value = "/doDeploy")
    public String doDeploy(String projectName,String ip){
        try {

        }catch (Exception e){

        }
        return "/backend/deploy";
    }
}
