package com.gjdt.modules.landmark.service;

import com.gjdt.modules.entity.Landmark;

import java.util.List;

public interface LandmarkService {
    Landmark selectLandPId(int project_id);

    Landmark selectOneById(int id);

    boolean addLandmark(Landmark landmark);

    boolean deleteLandmark(int id);

    boolean updateLandmark(Landmark landmark);

    List<Landmark> selectAll();
}
