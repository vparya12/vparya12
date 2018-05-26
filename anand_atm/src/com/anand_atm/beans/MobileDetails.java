package com.anand_atm.beans;

import java.util.Date;

public class MobileDetails {
	private Long mobileNumber;
	private String network;
	private String userName;
	private Long alternativeNumber;
	private Date lastRecharedDate;
	private Integer lastRechargedAmount;
	private Integer rechargeAmount;
	private Integer validDays;
	private boolean payment;
	
	public Long getMobileNumber() {
		return mobileNumber;
	}
	public void setMobileNumber(Long mobileNumber) {
		this.mobileNumber = mobileNumber;
	}
	public String getNetwork() {
		return network;
	}
	public void setNetwork(String network) {
		this.network = network;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Long getAlternativeNumber() {
		return alternativeNumber;
	}
	public void setAlternativeNumber(Long alternativeNumber) {
		this.alternativeNumber = alternativeNumber;
	}
	public Date getLastRecharedDate() {
		return lastRecharedDate;
	}
	public void setLastRecharedDate(Date lastRecharedDate) {
		this.lastRecharedDate = lastRecharedDate;
	}
	public Integer getLastRechargedAmount() {
		return lastRechargedAmount;
	}
	public void setLastRechargedAmount(Integer lastRechargedAmount) {
		this.lastRechargedAmount = lastRechargedAmount;
	}
	public Integer getValidDays() {
		return validDays;
	}
	public void setValidDays(Integer validDays) {
		this.validDays = validDays;
	}
	public boolean isPayment() {
		return payment;
	}
	public void setPayment(boolean payment) {
		this.payment = payment;
	}
	public Integer getRechargeAmount() {
		return rechargeAmount;
	}
	public void setRechargeAmount(Integer rechargeAmount) {
		this.rechargeAmount = rechargeAmount;
	}
	
	
}
