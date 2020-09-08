package com.gjdt.modules.landmark.service.impl;

import com.gjdt.modules.entity.Landmark;
import com.gjdt.modules.landmark.dao.LandmarkMapper;
import com.gjdt.modules.landmark.service.LandmarkService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("LandmarkService")
public class LandmarkServiceImpl implements LandmarkService {
    @Resource
    private LandmarkMapper landmarkMapper;

    @Override
    public Landmark selectLandPId(int project_id) {
        return landmarkMapper.selectLandPId(project_id);
    }

    @Override
    public Landmark selectOneById(int id) {
        return landmarkMapper.selectOneById(id);
    }

    @Override
    public boolean addLandmark(Landmark landmark) {
        return landmarkMapper.addLandmark(landmark);
    }

    @Override
    public boolean deleteLandmark(int id) {
        return landmarkMapper.deleteLandmark(id);
    }

    @Override
    public boolean updateLandmark(Landmark landmark) {
        return landmarkMapper.updateLandmark(landmark);
    }

    @Override
    public List<Landmark> selectAll() {
        return landmarkMapper.selectAll();
    }
}
