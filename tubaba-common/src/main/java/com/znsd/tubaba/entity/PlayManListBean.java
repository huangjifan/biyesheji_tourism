package com.znsd.tubaba.entity;

import java.util.ArrayList;
import java.util.List;

/**
 * @author 尹加豪
 *
 * @时间 2018年11月13日 下午9:23:04
 *
 * @描述: 游玩人信息list模型类(页面传list游玩人对象)
 */
public class PlayManListBean {
	
	public PlayManListBean() {
		super();
	}
	
	public PlayManListBean(List<PlayMan> playMans) {
		super();
		this.playMans = playMans;
	}

	/**
	 * 游玩人信息list
	 */
	private List<PlayMan> playMans = new ArrayList<>(10);

	public List<PlayMan> getPlayMans() {
		return playMans;
	}

	public void setPlayMans(List<PlayMan> playMans) {
		this.playMans = playMans;
	}
}
