package com.anand_atm.dao;

import java.util.List;

import com.anand_atm.beans.MobileDetails;

public interface MobileDAO {

	public void newMobileDetails(MobileDetails mobileVo);
	
	public List<MobileDetails> getMobileDetails();
	
	public void updateMobileNumber(MobileDetails mobileDetails);
	
	public void deleteMobileNumber(MobileDetails mobileDetails);
	
}
