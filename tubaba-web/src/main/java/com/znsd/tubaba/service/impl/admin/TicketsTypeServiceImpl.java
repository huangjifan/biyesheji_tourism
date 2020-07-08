/**
 * 下午4:15:44TODO
 */
package com.znsd.tubaba.service.impl.admin;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.znsd.tubaba.entity.Attractions;
import com.znsd.tubaba.entity.Scenic;
import com.znsd.tubaba.entity.Scenicimage;
import com.znsd.tubaba.entity.Scenicstatus;
import com.znsd.tubaba.entity.Scenicway;
import com.znsd.tubaba.entity.ScenicwayOrscenic;
import com.znsd.tubaba.entity.TicketsType;
import com.znsd.tubaba.entity.Title;
import com.znsd.tubaba.mapper.AddressMapper;
import com.znsd.tubaba.mapper.AttractionsMapper;
import com.znsd.tubaba.mapper.ScenicimageMapper;
import com.znsd.tubaba.mapper.ScenicstatusMapper;
import com.znsd.tubaba.mapper.TicketsTypeMapper;
import com.znsd.tubaba.mapper.TitleMapper;
import com.znsd.tubaba.service.ScenicService;
import com.znsd.tubaba.service.ScenicwayDepartService;
import com.znsd.tubaba.service.ScenicwayService;
import com.znsd.tubaba.service.admin.TicketsTypeService;
import com.znsd.tubaba.utils.PinYinUtil;


/**
 * @author Administrator
 *
 */
@Service
public class TicketsTypeServiceImpl implements TicketsTypeService {
	/*
	 * 门票类型Mapper
	 **/
	@Autowired
	TicketsTypeMapper ticketsTypeMapper;
	/*
	 * 景点
	 **/
@Autowired
	ScenicService scenicService;
	/*
	 * 图片
	 **/
	@Autowired
	ScenicimageMapper scenicimageMapper;
	/*
	 * 景点状态
	 **/
	@Autowired
	ScenicstatusMapper scenicstatusMapper;
	/*
	 * 主题mapper
	 **/
	@Autowired
	TitleMapper titleMapper;
	/*
	 * 地址mapper
	 **/
	@Autowired
	AddressMapper addressMapper;
	/*
	 * 景点类型
	 **/
	@Autowired
	AttractionsMapper attractionsMapper;
	/*
	 * 景点路线
	 **/
	@Autowired
	ScenicwayService scenicwayService;
	/*
	 * 
	 **/
	@Autowired
	ScenicwayDepartService scenicwayDepartService;
	
	@Override
	public Integer addTicketsType(TicketsType ticketsType) {
		return ticketsTypeMapper.addTicketsType(ticketsType);
	}
	


	@Transactional
	@Override
	public void addScenicAll(Scenic scenic,Scenicstatus status
			,TicketsType ticketsType,TicketsType ticketsType2
			,List<String> uploadFile) {
		//先增加景点表信息并且获取主键
		Integer scInteger = scenicService.addScenic(scenic);
		
		scenic.setId(scInteger);		
		status.setScenics(scenic);
		ticketsType.setScenic(scenic);
		ticketsType2.setScenic(scenic);
		Scenicimage scenicimage = new Scenicimage();
		for (String fileName : uploadFile) {
			scenicimage.setPath(fileName);
			scenicimage.setScenic(scenic);
			scenicimageMapper.addScenicImage(scenicimage);
		}
		scenicstatusMapper.addScenicstatus(status);
		ticketsTypeMapper.addTicketsType(ticketsType);
		ticketsTypeMapper.addTicketsType(ticketsType2);

	}


	@Override
	public List<TicketsType> queryTicketsById(Integer id) {
		return ticketsTypeMapper.queryTicketsById(id);
	}



	@Override
	public Integer updateTickets(String price, Integer id) {
		return ticketsTypeMapper.updateTickets(price, id);
	}


	@Override
	public TicketsType queryTicketsprice(Integer id, String type) {
		return ticketsTypeMapper.queryTicketsprice(id, type);
	}


	@Transactional
	@Override
	public void updateScenics(Scenic scenic, TicketsType adult, TicketsType chil, Date time
			,String adultprice
			,String childprice,String[] upload) {
		scenicimageMapper.deleteScenicimageByScenicId(scenic.getId());
		Scenicimage scenicimage = new Scenicimage();
		for (String st : upload) {
			scenicimage.setPath(st);
			scenicimage.setScenic(scenic);
			scenicimageMapper.addScenicImage(scenicimage);
		}
		
		ticketsTypeMapper.updateTickets(adultprice, adult.getId());
		ticketsTypeMapper.updateTickets(childprice, chil.getId());
		scenicstatusMapper.updateScenicServicingtime(time, scenic.getId());
		scenicService.updateScenic(scenic);
	}


	@Transactional
	@Override
	public void addScenicwayAll(Scenicway way, String[] uploadNames, Integer titleSelect, String endpath,
			String startpath, Integer attractions,Integer[] scnicId) {
		System.out.println("进来了没有");
		//主题类型
		Title title = titleMapper.queryTitleById(titleSelect);
		String end = addressMapper.queryAddressById(endpath);
		String start = addressMapper.queryAddressById(startpath);
		Attractions attraction = attractionsMapper.queryOneId(attractions);
		way.setWay_pinyin(PinYinUtil.getPingYin(way.getWay()));
		way.setEndpath(end);
		way.setStartpath(start);
		way.setTitle(title);
		way.setAttractions(attraction);
		int wayId = scenicwayService.addScenicWay(way);
		way.setId(wayId);
		Scenic sc = new Scenic();
		ScenicwayOrscenic scOrway = new ScenicwayOrscenic();
		for (int i = 0; i < scnicId.length; i++) {
			 sc.setId(scnicId[i]);
			 scOrway.setIndex(i);
			 scOrway.setScenic(sc);
			 scOrway.setScenicway(way);
			 scenicwayDepartService.updScenicwayOrscenic(scOrway);
		}
		
		
		Scenicimage scenicimage = new Scenicimage();
		for (String path : uploadNames) {
			scenicimage.setPath(path);
			scenicimage.setScenicway(way);
			scenicimageMapper.addScenicImage(scenicimage);
		}
		
	}


	@Transactional
	@Override
	public void updateScenicsway(Scenicway way, String uploadNmaes, Integer[] scnicId) {
		String[] split = uploadNmaes.split(",");
		Integer wayId = way.getId();
		scenicimageMapper.deleteScenicimageByScenicwayId(wayId);
		scenicwayDepartService.delScenicwayBywayId(wayId);
		
		Scenicimage scenicimage = new Scenicimage();
		for (String path : split) {
			scenicimage.setPath(path);
			scenicimage.setScenicway(way);
			scenicimageMapper.addScenicImage(scenicimage);
		}
		Scenic sc = new Scenic();
		ScenicwayOrscenic scOrway = new ScenicwayOrscenic();
		for (int i = 0; i < scnicId.length; i++) {
			 sc.setId(scnicId[i]);
			 scOrway.setIndex(i);
			 scOrway.setScenic(sc);
			 scOrway.setScenicway(way);
			 scenicwayDepartService.updScenicwayOrscenic(scOrway);
		}
		
		scenicwayService.updateScenicway(way);
	}

}
