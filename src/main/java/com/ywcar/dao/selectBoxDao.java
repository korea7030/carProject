package com.ywcar.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.ywcar.vo.CarVo;

public interface selectBoxDao {
	public HashMap<String, Integer> selectBox(HashMap<String, String> map) throws SQLException;
	public HashMap<String, Integer> selectBrand(HashMap<String, String> map) throws SQLException;
	public HashMap<String, Integer> selectProb(HashMap<String, String> map) throws SQLException;
	public HashMap<String, Integer> getCarInfo(HashMap<String, Object> map) throws SQLException;
	public ArrayList<CarVo> getHist(HashMap<String, Object> map) throws SQLException;
	public int getTotCount(HashMap<String, Object> map) throws SQLException;
}
