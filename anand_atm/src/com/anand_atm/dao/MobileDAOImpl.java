package com.anand_atm.dao;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;
import com.anand_atm.beans.MobileDetails;
import com.anand_atm.common.Constant;

@Component
public class MobileDAOImpl implements MobileDAO {
	@Autowired
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

	public MobileDAOImpl(DataSource dataSource) {
		namedParameterJdbcTemplate=new NamedParameterJdbcTemplate(dataSource);
	}
	

	@Override
	public void updateMobileNumber(MobileDetails mobileDetails) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteMobileNumber(MobileDetails mobileDetails) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<MobileDetails> getMobileDetails() {
		List<MobileDetails> mobileList = namedParameterJdbcTemplate.query(Constant.GET_ALL_MOBILE_NUMBER, new HashMap<String,Object>(), rs -> {
			List<MobileDetails> mobileLists = new ArrayList<MobileDetails>();
			if(rs!=null) {
				while(rs.next()) {
					MobileDetails mobile = new MobileDetails();
					
					mobile.setMobileNumber(rs.getLong("MOBILENUMBER"));
					mobile.setAlternativeNumber(rs.getLong("ALTNUMBER"));
					mobile.setNetwork(rs.getString("NETWORK"));
					mobile.setUserName(rs.getString("USERNAME"));
					mobile.setLastRecharedDate(rs.getDate("RECHARGEDATE"));
					mobile.setLastRechargedAmount(rs.getInt("AMOUNT"));
					mobile.setPayment(rs.getBoolean("PAYMENT"));
					mobile.setValidDays(rs.getInt("VALADITY"));
					
					mobileLists.add(mobile);
				}
			}
			return mobileLists;
		});
		return mobileList;
	}


	@Override
	public void newMobileDetails(MobileDetails mobileVo) {
		HashMap<String,Object> parameter = new HashMap<String,Object>();
		parameter.put("MOBILENUMBER", mobileVo.getMobileNumber());
		parameter.put("NETWORK", mobileVo.getNetwork());
		parameter.put("USERNAME", mobileVo.getUserName());
		parameter.put("VALADITY", mobileVo.getValidDays());
		parameter.put("ALTNUMBER", mobileVo.getAlternativeNumber());
		parameter.put("AMOUNT", mobileVo.getLastRechargedAmount());
		parameter.put("PAYMENT", mobileVo.isPayment());
		parameter.put("TEST", 1);
		parameter.put("TEST2", 1);
		namedParameterJdbcTemplate.update(Constant.INSERT_NEW_MOBILE, parameter);
		
	}
	
	
}
