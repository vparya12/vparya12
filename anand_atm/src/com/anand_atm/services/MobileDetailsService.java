package com.anand_atm.services;

import java.util.List;

import com.anand_atm.beans.MobileDetails;

public interface MobileDetailsService {

	public void newMobileDetails(MobileDetails mobileVO);
	
	public List<MobileDetails> getMobileDetails();
	
	public void updateMobileNumber(MobileDetails mobileDetails);
	
	public void deleteMobileNumber(MobileDetails mobileDetails);
	
		
}
