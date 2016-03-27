package com.ywcar.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.ywcar.service.selectBoxService;
import com.ywcar.util.Paging;
import com.ywcar.vo.CarVo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private selectBoxService selectboxService;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "home.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "home";
	}
	
	@RequestMapping(value = "prob.do", method = RequestMethod.POST)
	public ModelAndView getProbList(@RequestBody HashMap<String, String> json) throws UnsupportedEncodingException
	{
		System.out.println("year : "+json.get("year"));
		System.out.println("brand : "+json.get("brand"));
		System.out.println("model : "+json.get("model"));
		
		ModelAndView mav = new ModelAndView();
		String year = json.get("year");
		String brand = json.get("brand");
		String model = json.get("model");
		
//		System.out.println("제발 : "+model.replaceAll("\\?", " "));
//		System.out.println("Bytes : " + model.getBytes("UTF-8") );
//		model = URLDecoder.decode(model, "utf-8");
		
		System.out.println("변경 후 : "+model);
//		if (model.equals("A3") ) {
//			model = "A3 / S3";
//		}else if (model.equals("A4")) {
//			model = "A4 / S4";
//		}else if (model.equals("A6")) {
//			model = "A6 / S6";
//		}else if (model.equals("A8")) {
//			model = "A8 / S8";
//		}else if(model.equals("Tahoe")) {
//			model = "Tahoe / Suburban";
//		}else if(model.equals("Voyager / Grand Voyager")) {
//			model = "A3 / S3";
//		}else if(model.equals("Golf")) {
//			model = "Golf / GTI";
//		}
		
		HashMap<String, String> Parammap = new HashMap<String, String>();
//		HashMap<String, String> map = new HashMap<String, String>();
		Parammap.put("year", year);
		Parammap.put("brand",brand);
		Parammap.put("model", model);
//		List<String> modelList = new ArrayList<String>();
		try {
//			modelList = (List<String>) this.selectboxService.selectBox(Parammap);
			HashMap<String, Integer> probList = (HashMap<String, Integer>) this.selectboxService.selectProb(Parammap);
//			System.out.println(modelList.toString());
			Gson jsonMap = new Gson();
			if (probList.size() > 0) {
				mav.addObject("result", probList);
			}else {
				mav.addObject("result", "N");
			}
			
			System.out.println("controller prob : "+ probList);
//			System.out.println(carVo.toString());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	@RequestMapping(value = "brand.do", method = RequestMethod.POST)
	public ModelAndView getBrandList(@RequestBody HashMap<String, String> json)
	{
		System.out.println("year : "+json.get("year"));
		
		ModelAndView mav = new ModelAndView();
		String year = json.get("year");
		
		HashMap<String, String> Parammap = new HashMap<String, String>();
//		HashMap<String, String> map = new HashMap<String, String>();
		Parammap.put("year", year);
//		List<String> modelList = new ArrayList<String>();
		try {
//			modelList = (List<String>) this.selectboxService.selectBox(Parammap);
			HashMap<String, Integer> brandList = (HashMap<String, Integer>) this.selectboxService.selectBrand(Parammap);
//			System.out.println(modelList.toString());
			Gson jsonMap = new Gson();
			if (brandList.size() > 0) {
				mav.addObject("result", brandList);
			}else {
				mav.addObject("result", "N");
			}
			
			System.out.println("controller brand : "+ brandList);
//			System.out.println(carVo.toString());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	@RequestMapping(value = "select.do", method = RequestMethod.POST)
	public ModelAndView getSeleclist(@RequestBody HashMap<String, String> json)
	{
		System.out.println("brand : "+json.get("brand"));
		System.out.println("year : "+json.get("year"));
		
		ModelAndView mav = new ModelAndView();
//		mav.setViewName("ajax/select");
		String brand = json.get("brand");
		String year = json.get("year");
		
		HashMap<String, String> Parammap = new HashMap<String, String>();
//		HashMap<String, String> map = new HashMap<String, String>();
		
		Parammap.put("brand", brand);
		Parammap.put("year", year);
//		List<String> modelList = new ArrayList<String>();
		try {
//			modelList = (List<String>) this.selectboxService.selectBox(Parammap);
			HashMap<String, Integer> modelList = (HashMap<String, Integer>) this.selectboxService.selectBox(Parammap);
//			System.out.println(modelList.toString());
			Gson jsonMap = new Gson();
			if (modelList.size() > 0) {
				mav.addObject("result", modelList);
			}else {
				mav.addObject("result", "N");
			}
			
			System.out.println("controller : "+ modelList);
//			System.out.println(carVo.toString());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	@ModelAttribute("CarVo")
	public CarVo setUpForm() {
		return new CarVo();
	}
	
	@RequestMapping(value="searchCar.do", method=RequestMethod.POST)
	public ModelAndView searchCar(@ModelAttribute("CarVo")CarVo carvo, ModelMap model) throws SQLException{
		ModelAndView mv = new ModelAndView();
		String car_nm = carvo.getVHICHL_NM();
		String year = carvo.getVHICHL_REG_DT();
		String car_model = carvo.getVHICHL_REQ_DT();
		String prob_area = carvo.getVHICHL_WRK_ID();
		
		if (prob_area.equals("Engine") ) {
			mv.addObject("prob", "Engine");
		}
		else if (prob_area.equals("Transmission and Drivetrain")) {
			mv.addObject("prob", "Transmission and Drivetrain");
		}else if (prob_area.equals("Brakes and Traction Control")) {
			mv.addObject("prob", "Brakes and Traction Control");
		}else if (prob_area.equals("Suspension and Steering")) {
			mv.addObject("prob", "Suspension and Steering");
		}else if (prob_area.equals("Electrical and Air Conditioning")) {
			mv.addObject("prob", "Electrical and Air Conditioning");
		}else if (prob_area.equals("Paint, Rust, Leaks, Rattles, and Trim")) {
			mv.addObject("prob", "Paint, Rust, Leaks, Rattles, and Trim");
		}else {
			mv.addObject("prob", "Other");
		}
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("VHICHL_NM", car_nm);
		paramMap.put("VHICHL_REG_DT", year);
		paramMap.put("VHICHL_CMP_DT", car_model);
		paramMap.put("VHICHL_CMPNT_CD", prob_area);
		
		System.out.println("Map : "+paramMap.toString());
		HashMap<String, Integer> carCountlst = (HashMap<String, Integer>)this.selectboxService.getCarInfo(paramMap);

		Gson jsonMap = new Gson();
		System.out.println(carCountlst);
		if (carCountlst.size() > 0) {
			mv.addObject("carCount",jsonMap.toJson(carCountlst));
		}else {
			mv.addObject("carCount","No Result");
		}
		
		int totCount = this.selectboxService.getTotCount(paramMap);
		
		// 첫번째 검색은 무조건 1~5 페이지
		paramMap.put("start", 0);
		
		ArrayList<CarVo> carHist = (ArrayList<CarVo>)this.selectboxService.getHist(paramMap);
		
		if (!carHist.isEmpty() ) {
			mv.addObject("carHist", carHist);
		}else {
			mv.addObject("carHist", "N");
		}
		
		Paging paging = new Paging();
		paging.setPageNo(1);				// 페이지번호
		paging.setPageSize(5);				// 한 페이지 당 게시글 개수
		paging.setTotalCount(totCount);  // 전체건수
		paging.makePaging();
		
		System.out.println(paging);
		
		mv.addObject("totCount", totCount);
		mv.addObject("count", paging.getTotalCount()+"건");
		mv.addObject("paging", paging);
		mv.addObject("brand", car_nm);
		mv.addObject("year", year);
		mv.addObject("model", car_model);
		mv.addObject("prob", prob_area);
		mv.addObject("hist", "<"+year+" "+car_nm+" "+car_model+">");
		mv.setViewName("carhistbody");
		
		return mv;
	}
	
	@RequestMapping(value="goPage.do", method=RequestMethod.POST)
	public ModelAndView goPage(@RequestParam(value = "pageNo",required = false) int pageNo,
			@RequestParam(value = "year",required = false) String year,
			@RequestParam(value = "brand",required = false) String brand,
			@RequestParam(value = "model",required = false) String model,
			@RequestParam(value = "prob",required = false) String prob,
			@RequestParam(value = "carCount",required = false) Object carCount,
			@RequestParam(value = "totCount", required = false) int totCount
			) throws SQLException{
		
		System.out.println(carCount);
		System.out.println(pageNo);
		ModelAndView mv = new ModelAndView();
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		
		if (pageNo == 1) {
			paramMap.put("start", 0);
		} else {
			paramMap.put("start", (pageNo*5)-5);
		}
		paramMap.put("VHICHL_NM", brand);
		paramMap.put("VHICHL_REG_DT", year);
		paramMap.put("VHICHL_CMP_DT", model);
		paramMap.put("VHICHL_CMPNT_CD", prob);
		
		ArrayList<CarVo> carHist = (ArrayList<CarVo>)this.selectboxService.getHist(paramMap);
		
		Paging paging = new Paging();
		paging.setPageNo(pageNo);				// 페이지번호
		paging.setPageSize(5);				// 한 페이지 당 게시글 개수
		paging.setTotalCount(totCount);  // 전체건수
		paging.makePaging();
		
//		Gson jsonMap = new Gson();
		
		mv.addObject("paging", paging);
		mv.addObject("count", paging.getTotalCount()+"건");
		mv.addObject("brand", brand);
		mv.addObject("year", year);
		mv.addObject("model", model);
		mv.addObject("prob", prob);
		mv.addObject("carCount", carCount);
		mv.addObject("carHist", carHist);
		mv.addObject("hist", "<"+year+" "+brand+" "+model+">");
		mv.addObject("totCount", totCount);
		mv.setViewName("second");
		return mv;
		
	}
}
