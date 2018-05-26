package com.anand_atm.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.anand_atm.beans.MobileDetails;
import com.anand_atm.dao.MobileDAO;

import javafx.beans.binding.MapBinding;

@Service
public class MobileDetailsServiceImpl implements MobileDetailsService{

	@Autowired
	private MobileDAO mobileDao;

	@Override
	public List<MobileDetails> getMobileDetails() {
		List<MobileDetails> mobileList = mobileDao.getMobileDetails();
		return mobileList;
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
	public void newMobileDetails(MobileDetails mobileVO) {
		if(mobileVO.getAlternativeNumber() == null) {
			mobileVO.setAlternativeNumber(0L);
		}
		mobileVO.setLastRechargedAmount(mobileVO.getRechargeAmount());
		mobileDao.newMobileDetails(mobileVO);
		
	}

}
