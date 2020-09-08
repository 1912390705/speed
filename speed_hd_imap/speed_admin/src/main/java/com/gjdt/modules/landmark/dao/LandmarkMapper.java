package com.gjdt.modules.landmark.dao;

import com.gjdt.modules.entity.Landmark;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface LandmarkMapper {
    Landmark selectLandPId(int project_id);

    Landmark selectOneById(int id);

    boolean addLandmark(Landmark landmark);

    boolean deleteLandmark(int id);

    boolean updateLandmark(Landmark landmark);

    List<Landmark> selectAll();
}
