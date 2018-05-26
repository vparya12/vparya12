package com.anand_atm.dao;

import java.util.List;

import com.anand_atm.beans.DTHDetails;

public interface DTHDAO {

	public void newDthDetails(DTHDetails dthVO);
	
	public List<DTHDetails> getDTHDetails();
	
	public void updateDTHNumber(DTHDetails dthDetails);
	
	public void deleteDTHNumber(DTHDetails dthDetails);
	
}

