package com.lyy.backend.action;

import java.io.*;

/**
 * Created by fanshuai on 17/3/20.
 */
public class RunCommandBO {
    public void runCommand(String commandFileName,String param){
        try {
            String commandFile = getCommandFile(commandFileName);
            String command = "sh "+commandFile +" "+ param;
            String chmodCommand = "chmod a+x "+commandFile;
            runCommand(chmodCommand);
            runCommand(command);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public void  runCommand(String command) throws InterruptedException, IOException {
        Process chmodProcess = Runtime.getRuntime().exec(command);
        BufferedReader bufferedReader = new BufferedReader( new InputStreamReader(chmodProcess.getInputStream()));
        String outPutLine = null;
        while ( (outPutLine=bufferedReader.readLine()) == null){
            System.out.println(outPutLine);
        }
        bufferedReader.close();
        chmodProcess.waitFor(); //阻塞，直到上述命令执行完
    }

    /**
     * 获取执行命令的绝对路径
     * @param commandFileName
     * @return
     */
    private String getCommandFile(String commandFileName) throws FileNotFoundException{
        String commandFile = this.getClass().getClassLoader().getResource(commandFileName).getFile();
        File f = new File(commandFile);
        if (f.exists() && f.isFile()){
            return commandFile;
        }
        throw new FileNotFoundException(commandFile);
    }

}
