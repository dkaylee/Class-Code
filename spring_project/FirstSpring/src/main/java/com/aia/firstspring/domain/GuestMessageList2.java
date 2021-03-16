package com.aia.firstspring.domain;

import java.util.List;

public class GuestMessageList2 {

	private List<GuestMessage2> message;
	
	public GuestMessageList2() {
	}

	public GuestMessageList2(List<GuestMessage2> message) {
		this.message = message;
	}

	public List<GuestMessage2> getMessage() {
		return message;
	}

	public void setMessage(List<GuestMessage2> message) {
		this.message = message;
	}

}