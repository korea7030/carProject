package com.ywcar.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ywcar.dao.selectBoxDao;
import com.ywcar.vo.CarVo;

@Service
public class selectBoxServiceImpl implements selectBoxService {

	@Autowired
	private selectBoxDao selectBoxdao;
	
//	@Override
//	public String selectBox() throws SQLException {
//		// TODO Auto-generated method stub
//		String res = selectBoxdao.selectBox();
//		System.out.println(res);
//		return res;
//	}

	@Override
	public HashMap<String, Integer> selectBox(HashMap<String, String> map)
			throws SQLException {
		System.out.println("Service : "+map);
		return this.selectBoxdao.selectBox(map);
	}

	@Override
	public HashMap<String, Integer> getCarInfo(HashMap<String, Object> map)
			throws SQLException {
		// TODO Auto-generated method stub
//		System.out.println(this.selectBoxdao.getCarInfo(map));
		return this.selectBoxdao.getCarInfo(map);
	}

	@Override
	public ArrayList<CarVo> getHist(HashMap<String, Object> map) throws SQLException {
		// TODO Auto-generated method stub
		return this.selectBoxdao.getHist(map);
	}

	@Override
	public int getTotCount(HashMap<String, Object> map) throws SQLException {
		// TODO Auto-generated method stub
		return this.selectBoxdao.getTotCount(map);
	}

	@Override
	public HashMap<String, Integer> selectBrand(HashMap<String, String> map)
			throws SQLException {
		// TODO Auto-generated method stub
		System.out.println(this.selectBoxdao.selectBrand(map));
		return this.selectBoxdao.selectBrand(map);
	}

	@Override
	public HashMap<String, Integer> selectProb(HashMap<String, String> map)
			throws SQLException {
		// TODO Auto-generated method stub
		return this.selectBoxdao.selectProb(map);
	}

}
