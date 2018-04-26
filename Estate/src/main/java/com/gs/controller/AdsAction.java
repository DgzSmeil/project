package com.gs.controller;

import java.io.File;
import java.io.IOException;
import java.net.InetAddress;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.gs.pojo.Activity;
import com.gs.pojo.Ads;
import com.gs.pojo.Article;
import com.gs.service.AdsService;
import com.gs.service.ArticleService;
import com.opensymphony.xwork2.ActionSupport;

public class AdsAction extends ActionSupport
{
	//文件上传
	private String imageFileName;
	private File upload;
	private String imageContentType = "jpg";
	private int pageSize;
	private int pageNumber;
	private int total;//每页显示数
	private List<Ads> rows;//第几页
	private String searchText;
	private Ads ads;
	private AdsService adsService;
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session=request.getSession();
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	private String msg;
	public Ads getAds() {
		return ads;
	}
	public void setAds(Ads ads) {
		this.ads = ads;
	}
	public int getTotal() {
		return total;
	}

	public List<Ads> getRows() {
		return rows;
	}
	public void setUpload(File upload) {
		this.upload = upload;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}
	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}

	public void setAdsService(AdsService adsService) {
		this.adsService = adsService;
	}
	public String adsPage() throws IOException{
		return "adsPage";
	}
	public String adsPager() throws IOException{
		HttpSession session1=request.getSession();
		if(session1.getAttribute("search")!=null)
		{
			session1.setAttribute("search",null);
			Ads ads1=(Ads)session1.getAttribute("ads");
			rows=adsService.search(pageNumber, pageSize, ads1);
			total=adsService.searchcount(ads1);
			return "returnjson";
		}else if(searchText!=null&&!searchText.equals(""))
		{
			rows=adsService.allsearch(pageNumber, pageSize, searchText);
			total=adsService.allsearchcount(searchText);
			return "returnjson";
		}else{
			rows=adsService.adsPager(pageNumber, pageSize);
			total=adsService.adsCount();
			return "returnjson";
		}
	}
	public String adsAddPage() throws IOException{
		return "adsAddPage";
	}
	public String adsAdd() throws IOException{
		Date currentTime = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		String dateString = formatter.format(currentTime);
		imageFileName = dateString;
		HttpServletRequest request = ServletActionContext.getRequest();
		String realpath = request.getRealPath("/upload");
		if (upload != null) {
			File savefile = new File(new File(realpath), imageFileName + "." + imageContentType);
			if (!savefile.getParentFile().exists())
				savefile.getParentFile().mkdirs();
			FileUtils.copyFile(upload, savefile);
			String path = imageFileName;
			path += "." + imageContentType;
			ads.setLogo(path);
		}
		String IP="";
		try{
			InetAddress myip= InetAddress.getLocalHost();
			IP=myip.getHostAddress();
			}catch(Exception e){
			e.printStackTrace();
			}
		String uuid = UUID.randomUUID().toString().replaceAll("-", "");
		System.out.println(uuid);
		ads.setId(uuid);
		ads.setAd_url("/Estate/ads/showAds?ads.id="+uuid);
		ads.setCreated_time(new Date());
		ads.setStatus("Y");
		adsService.add(ads);
		return "adsPage";
	}
	public String adsEditPage() throws IOException{
		ads=adsService.queryById(ads.getId());
		request.setAttribute("ads",ads );
		return "adsEditPage";
	}
	public String adsEdit() throws IOException{
		Date currentTime = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		String dateString = formatter.format(currentTime);
		imageFileName = dateString;
		HttpServletRequest request = ServletActionContext.getRequest();
		String realpath = request.getRealPath("/upload");
		if (upload != null) {
			File savefile = new File(new File(realpath), imageFileName + "." + imageContentType);
			if (!savefile.getParentFile().exists())
				savefile.getParentFile().mkdirs();
			FileUtils.copyFile(upload, savefile);
			String path = imageFileName;
			path += "." + imageContentType;
			ads.setLogo(path);
		}
		adsService.update(ads);
		return "adsPage";
	}
	public String showAds() throws IOException{
		ads=adsService.showAds(ads.getId());
		return "showAds";
	}
	public String adsLook() throws IOException{
		ads=adsService.queryById(ads.getId());
		request.setAttribute("ads",ads );
		return "adsLook";
	}
	public String active() throws Exception {
		adsService.active(ads.getId());
		msg = "该广告已启用！";
		return "returnjson";
	}
	public String inactive() throws Exception {
		adsService.inactive(ads.getId());
		msg = "该广告已禁用！";
		return "returnjson";
	}
	public String search() throws Exception {
		System.out.println("search======"+ads.getTitle());
		HttpSession session=request.getSession();
		session.setAttribute("search","88");
		session.setAttribute("ads",ads);
		return "adsPage";
	}
}
