package com.anand_atm.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;
import com.anand_atm.beans.DTHDetails;
import com.anand_atm.common.Constant;

@Component
public class DTHDAOImpl implements DTHDAO {
	
	@Autowired
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;
	
	public void setNamedParameterJdbcTemplate(NamedParameterJdbcTemplate namedParameterJdbcTemplate) {
		this.namedParameterJdbcTemplate = namedParameterJdbcTemplate;
	}

	@Override
	public List<DTHDetails> getDTHDetails() {
		//Java 8 coding
		List<DTHDetails> dthList = namedParameterJdbcTemplate.query(Constant.GET_ALL_DTH_NUMBER, new HashMap<String,Object>(), rs -> {
			List<DTHDetails> dth_List = new ArrayList<>();
			if(rs!=null) {
				while(rs.next()) {
					DTHDetails dth = new DTHDetails();
					dth.setDthNumber(rs.getLong("DTHNUMBER"));
					dth.setMobileNumber(rs.getLong("MOBILENUMBER"));
					dth.setAlternativeNumber(rs.getLong("ALTNUMBER"));
					dth.setLastRecharedDate(rs.getDate("RECHARGEDATE"));
					dth.setNetwork(rs.getString("NETWORK"));
					dth.setPayment(rs.getBoolean("PAYMENT"));
					dth.setUserName(rs.getString("USERNAME"));
					dth.setValidDays(rs.getInt("VALADITY"));
					dth.setLastRechargedAmount(rs.getInt("AMOUNT"));
					
					dth_List.add(dth);
				}
			}
			return dth_List;
			
		});
		return dthList;
	}

	@Override
	public void updateDTHNumber(DTHDetails dthDetails) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteDTHNumber(DTHDetails dthDetails) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void newDthDetails(DTHDetails dthVO) {
		HashMap<String,Object> parameter = new HashMap<String,Object>();
		parameter.put("DTHNUMBER", dthVO.getDthNumber());
		parameter.put("MOBILENUMBER", dthVO.getMobileNumber());
		parameter.put("NETWORK", dthVO.getNetwork());
		parameter.put("USERNAME", dthVO.getUserName());
		parameter.put("VALADITY", dthVO.getValidDays());
		parameter.put("AMOUNT", dthVO.getLastRechargedAmount());
		parameter.put("ALTNUMBER", dthVO.getAlternativeNumber());
		parameter.put("PAYMENT", dthVO.isPayment());
		parameter.put("TEST", 1);
		
		namedParameterJdbcTemplate.update(Constant.INSERT_NEW_DTH, parameter);
		
	}

}
