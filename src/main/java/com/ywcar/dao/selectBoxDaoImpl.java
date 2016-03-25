package com.ywcar.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ywcar.vo.CarVo;

@Repository("selectBoxDao")
public class selectBoxDaoImpl extends SqlMapClientDaoSupport implements selectBoxDao {

	@Autowired
	public void setsupserSqlMapClient(SqlMapClient sqlMapClient) {
		setSqlMapClient(sqlMapClient);
	}

	@Override
	public HashMap<String, Integer> selectBox(HashMap<String, String> map)
			throws SQLException {
		// TODO Auto-generated method stub
		System.out.println("DaO : "+map);
//		System.out.println(this.getSqlMapClientTemplate().queryForList("sql.SelectBox",map));
		return (HashMap<String, Integer>) this.getSqlMapClientTemplate().queryForMap("sql.SelectBox",map, "VHICHL_CMP_DT", "COUNT");
	}

	@Override
	public HashMap<String, Integer> getCarInfo(HashMap<String, Object> map)
			throws SQLException {
		// TODO Auto-generated method stub
//		System.out.println((List<String>) this.getSqlMapClientTemplate().queryForList("sql.getCarInfo",map));
		return (HashMap<String, Integer>) this.getSqlMapClientTemplate().queryForMap("sql.getCarInfo",map, "VHICHL_CMPNT_CD", "COUNT");
	}

	@Override
	public ArrayList<CarVo> getHist(HashMap<String, Object> map) throws SQLException {
		// TODO Auto-generated method stub
		return (ArrayList<CarVo>)this.getSqlMapClientTemplate().queryForList("sql.getHist", map);
	}

	@Override
	public int getTotCount(HashMap<String, Object> map) throws SQLException {
		// TODO Auto-generated method stub
		return (Integer)this.getSqlMapClientTemplate().queryForObject("sql.getTotCount", map);
	}

	@Override
	public HashMap<String, Integer> selectBrand(HashMap<String, String> map)
			throws SQLException {
		// TODO Auto-generated method stub
//		System.out.println(map);
		System.out.println((HashMap<String, Integer>) this.getSqlMapClientTemplate().queryForMap("sql.SelectBrand",map, "VHICHL_NM", "COUNT"));
		return (HashMap<String, Integer>) this.getSqlMapClientTemplate().queryForMap("sql.SelectBrand",map, "VHICHL_NM", "COUNT");
	}

	@Override
	public HashMap<String, Integer> selectProb(HashMap<String, String> map)
			throws SQLException {
		// TODO Auto-generated method stub
		return (HashMap<String, Integer>) this.getSqlMapClientTemplate().queryForMap("sql.SelectProb",map, "VHICHL_CMPNT_CD", "COUNT");
	}
	
//	@Override
//	public String selectBox() throws SQLException {
//		// TODO Auto-generated method stub
//		String result = (String)query.queryForObject("sql.SelectBox");
//		System.out.println("°á°ú : "+result);
//		return result;
//	}

}
