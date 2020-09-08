package com.gjdt.modules.landmark.controller;

import com.gjdt.modules.entity.Landmark;
import com.gjdt.modules.entity.Result;
import com.gjdt.modules.landmark.service.LandmarkService;
import com.gjdt.modules.project.service.ProjectService;
import com.gjdt.modules.util.FileUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.List;


@RestController
@RequestMapping("landmark")
public class LandmarkController {
    @Resource
    private LandmarkService landmarkService;
    @Resource
    private ProjectService projectService;
    @RequestMapping("/selectLandPId")
    public Landmark selectLandPId(int project_id) {
        return landmarkService.selectLandPId(project_id);
    }
    @RequestMapping("/selectAll")
    public List<Landmark> selectAll(){
        List<Landmark> landmarks = landmarkService.selectAll();
        for(int i = 0 ;i<landmarks.size();i++){
            landmarks.get(i).setProject(projectService.selectOne(landmarks.get(i).getProject_id()));
        }
        return landmarks;
    }

    @RequestMapping("/selectOneById")
    public Landmark selectOneById(int id) {
        return landmarkService.selectOneById(id);
    }

    @RequestMapping("/addLandmark")
    public Result addLandmark(Landmark landmark, @RequestParam("fileName") MultipartFile file) {
        Result result = new Result();
        if (file.isEmpty()) {
            boolean b = landmarkService.addLandmark(landmark);
            if (b) {
                result.setCode(true);
                result.setMsg("添加成功");
            } else {
                result.setCode(false);
                result.setMsg("添加失败");
            }
        } else {
            if (FileUtils.fileUpload(file)) {
                String fileName = file.getOriginalFilename();
                landmark.setFilename(fileName);
                boolean b = landmarkService.addLandmark(landmark);
                if (b) {
                    result.setCode(true);
                    result.setMsg("添加成功");
                } else {
                    result.setCode(false);
                    result.setMsg("添加失败");
                }
            } else {
                result.setCode(false);
                result.setMsg("文件上传失败");
            }
        }
        return result;
    }

    @RequestMapping("file")
    public String file() {
        return "/file";
    }

    @RequestMapping("/deleteLandmark")
    public Result deleteLandmark(int id) {
        Result result = new Result();
        Landmark landmark = landmarkService.selectOneById(id);
        File file = new File("F:/test/" + landmark.getFilename());
        if (file.exists()) {
            file.delete();
        }
        boolean b = landmarkService.deleteLandmark(id);
        if (b) {
            result.setCode(true);
            result.setMsg("删除成功");
        } else {
            result.setCode(true);
            result.setMsg("删除失败");
        }
        return result;
    }

    @RequestMapping("/downloadFile")
    public void downloadFile(String fileName, HttpServletResponse response, HttpServletRequest request) throws IOException {
        System.out.println(11111);
        FileUtils.downLoad(request, response, fileName);
    }

    @RequestMapping("/updateLandmark")
    public Result updateLandmark(Landmark landmark, @RequestParam("fileName") MultipartFile file) {
        Result result = new Result();
        Landmark landmark1 = landmarkService.selectOneById(landmark.getId());
        File f = new File("F:/test/" + landmark1.getFilename());
        if (f.exists()) {
            f.delete();
        }

        if (FileUtils.fileUpload(file)) {
            String fileName = file.getOriginalFilename();
            landmark.setFilename(fileName);
            System.out.println(landmark.toString());
            boolean b = landmarkService.updateLandmark(landmark);
            if (b) {
                result.setCode(true);
                result.setMsg("修改成功");
            } else {
                result.setCode(false);
                result.setMsg("修改失败");
            }
        } else {
            result.setCode(false);
            result.setMsg("文件上传失败");
        }

        return result;
    }

}
