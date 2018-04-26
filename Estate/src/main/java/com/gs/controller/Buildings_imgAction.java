package com.gs.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;


import com.alibaba.fastjson.JSON;
import com.gs.pojo.Agency;
import com.gs.pojo.Buildings;
import com.gs.pojo.BuildingsImg;
import com.gs.service.Buildings_imgService;
import com.opensymphony.xwork2.ActionSupport;

public class Buildings_imgAction extends ActionSupport{

	private static final long serialVersionUID = -5768464357507854436L;

	private Agency agency;
	private BuildingsImg buildingsImg;
	private Buildings buildings;
	
	private Buildings_imgService buildings_imgService;
	private List<String> uploadFileName;
	private List<File> upload;
	//分页所需
	private int pageSize;//每页显示数
	private int pageNumber;//第几页
	private int total;//总计路数
	private List<BuildingsImg> rows;//所有记录
	private String buildings_id;
	private String searchText;
	HttpServletResponse response = ServletActionContext.getResponse();
	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}

	public List<BuildingsImg> getRows() {
		return rows;
	}

	public void setRows(List<BuildingsImg> rows) {
		this.rows = rows;
	}

	public String getBuildings_id() {
		return buildings_id;
	}

	public void setBuildings_id(String buildings_id) {
		this.buildings_id = buildings_id;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}
	
	public List<String> getUploadFileName() {
		return uploadFileName;
	}

	public void setBuildings_imgService(Buildings_imgService buildings_imgService) {
		this.buildings_imgService = buildings_imgService;
	}

	public void setUploadFileName(List<String> uploadFileName) {
		this.uploadFileName = uploadFileName;
	}


	public Buildings getBuildings() {
		return buildings;
	}

	public void setBuildings(Buildings buildings) {
		this.buildings = buildings;
	}

	public BuildingsImg getBuildingsImg() {
		return buildingsImg;
	}

	public void setBuildingsImg(BuildingsImg buildingsImg) {
		this.buildingsImg = buildingsImg;
	}

	public List<File> getUpload() {
		return upload;
	}

	public void setUpload(List<File> upload) {
		this.upload = upload;
	}

	public Agency getAgency() {
		return agency;
	}
	public void setAgency(Agency agency) {
		this.agency = agency;
	}
	
	//进入添加页面
	public String addInfo() throws Exception{
		System.out.println(buildingsImg.getBuildings_id());
		return "addInfo";
	}
	//新增
	public String add() throws Exception{
		String path = ServletActionContext.getRequest().getRealPath("/upload");
        for(int i = 0 ; i < upload.size() ; i++ ){
        	Date currentTime = new Date();
    		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
    		String dateString = formatter.format(currentTime);
            OutputStream os = new FileOutputStream(new File(path,dateString+i+i+uploadFileName.get(i)));  
            InputStream is = new FileInputStream(upload.get(i));  
            byte[] buf = new byte[1024];  
            int length = 0 ;  
            while(-1 != (length = is.read(buf) ) ){  
                os.write(buf, 0, length) ;  
            }  
            BuildingsImg bImg = new BuildingsImg();
            bImg.setBuildings_id(buildingsImg.getBuildings_id());
            bImg.setImg_des("暂无");
            bImg.setImg_path(dateString+i+i+uploadFileName.get(i));
            bImg.setCreated_time(currentTime);
            buildings_imgService.add(bImg);
            is.close();  
            os.close();  
        }
        buildings_id =buildingsImg.getBuildings_id();
		return "list1";
	}
	//分页列表
	public String list1(){
		
		return "list1";
	}
	public String list(){
		if (searchText!=null && !searchText.equals("")) {
			rows = buildings_imgService.search(pageNumber, pageSize, searchText, buildings_id);
			total = buildings_imgService.searchcount(searchText, buildings_id);
			return "list";
		}else{
			rows=buildings_imgService.list(pageSize, pageNumber, buildings_id);
			total=buildings_imgService.count(buildings_id);
			return "list";
		}
	}
	public String look() throws Exception{
		response.setContentType("text/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		rows = buildings_imgService.querylist(buildings_id);
		out.println(JSON.toJSONString(rows));
		return null;
	}

	//manager satart
	public String mgnBdsImgPage(){
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		session.setAttribute("buildingsid",buildingsImg.getBuildings_id());
		return "mgnBdsImgPage";
	}
	public String mgnBdsImgPager(){
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		if (searchText!=null && !searchText.equals("")) {
			rows = buildings_imgService.search(pageNumber, pageSize, searchText, session.getAttribute("buildingsid").toString());
			total = buildings_imgService.searchcount(searchText, session.getAttribute("buildingsid").toString());
			return "returnjson";
		}else{
			rows=buildings_imgService.list(pageSize, pageNumber, session.getAttribute("buildingsid").toString());
			total=buildings_imgService.count(session.getAttribute("buildingsid").toString());
			return "returnjson";
		}
	}
	//end
}
