package itemboard.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import itemboard.bean.ItemBasketDTO;
import itemboard.bean.ItemBasketListDTO;
import itemboard.bean.ItemOrderDTO;
import itemboard.bean.ItemboardDTO;
import itemboard.bean.ItemboardPaging;
import itemboard.bean.ReviewDTO;
import itemboard.dao.ItemboardDAO;
import user.bean.UserDTO;

@Controller
@RequestMapping(value="/itemboard")
public class ItemboardController {
	@Autowired
	private ItemboardDAO itemboardDAO;
	@Autowired
	private ItemboardPaging itemboardPaging;
	
	
	@RequestMapping(value="/itemboardWrite.do", method=RequestMethod.POST)
	public String itemboardWrite(@ModelAttribute ItemboardDTO itemboardDTO,
								  @RequestParam MultipartFile[] img,
								  Model model) {
		//filePath 이 부분 통힐하기 전까지 각자 설정하셔야 해요
		String filePath = "C:\\Spring\\project\\shoppingmall\\src\\main\\webapp\\storage";
		String fileName;
		File file;
		
		//-----------------------
		if(img[0]!=null) {
			fileName = img[0].getOriginalFilename();
			file = new File(filePath, fileName);
			try {
				FileCopyUtils.copy(img[0].getInputStream(), new FileOutputStream(file));
			} catch (IOException e) {
				e.printStackTrace();
			}
		
			itemboardDTO.setImg1(fileName);
		}else {
			itemboardDTO.setImg1(null);
		}
		//-------------------
		if(img[1]!=null) {
			fileName = img[1].getOriginalFilename();
			file = new File(filePath, fileName);
			try {
				FileCopyUtils.copy(img[1].getInputStream(), new FileOutputStream(file));
			} catch (IOException e) {
				e.printStackTrace();
			}
		
			itemboardDTO.setImg2(fileName);
		}else {
			itemboardDTO.setImg2(null);
		}
		//-----------------------
		if(img[2]!=null) {
			fileName = img[2].getOriginalFilename();
			file = new File(filePath, fileName);
			try {
				FileCopyUtils.copy(img[2].getInputStream(), new FileOutputStream(file));
			} catch (IOException e) {
				e.printStackTrace();
			}
			itemboardDTO.setImg3(fileName);
		}else {
			itemboardDTO.setImg3(null);
		}
		//----------------------------------------------------
		if(img[3]!=null) {
			fileName = img[3].getOriginalFilename();
			file = new File(filePath, fileName);
			try {
				FileCopyUtils.copy(img[3].getInputStream(), new FileOutputStream(file));
			} catch (IOException e) {
				e.printStackTrace();
			}
			itemboardDTO.setImg4(fileName);
		}else {
			itemboardDTO.setImg4(null);
		}
		
		
//		System.out.println(itemboardDTO);
		itemboardDAO.itemboardWrite(itemboardDTO);
		
		//model.addAttribute("display", "/itemboard/itemboardList.jsp");
		model.addAttribute("display", "/manager/managerPage.jsp");
		return "/main/index";
	}

	@RequestMapping(value="/itemboardList.do", method=RequestMethod.GET)
	public String itemboardList(@RequestParam(required=false, defaultValue="1") String pg, @RequestParam(required=false, defaultValue="") String categoryCode, Model model) {
		model.addAttribute("pg", pg);
		model.addAttribute("categoryCode", categoryCode);
		model.addAttribute("display", "/itemboard/itemboardList.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value="/itemBasketList.do", method=RequestMethod.GET)
	public String itemBasketList(@RequestParam(required=false, defaultValue="1") String pg, @RequestParam(required=false, defaultValue="") String categoryCode, Model model) {
		model.addAttribute("pg", pg);
		model.addAttribute("categoryCode", categoryCode);
		model.addAttribute("title", "나의 장바구니");
		model.addAttribute("display", "/itemboard/itemBasketList.jsp");
		return "/main/index";
	}

	@RequestMapping(value="/getItemboardList.do", method=RequestMethod.POST)
	public ModelAndView getItemboardList(@RequestParam(required=false, defaultValue="1") String pg, @RequestParam(required=false, defaultValue="") String categoryCode) {
//		System.out.println("categoryCode = " + categoryCode);
		//DB - 1�럹�씠吏��떦 3媛쒖뵫
		int endNum = Integer.parseInt(pg)*4;
		int startNum = endNum-3;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("categoryCode", categoryCode);
	
		List<ItemboardDTO> list = itemboardDAO.getItemboardList(map);
		
		//�럹�씠吏뺤쿂由�
		int totalA = itemboardDAO.getTotalA(map);
		itemboardPaging.setCurrentPage(Integer.parseInt(pg));
		itemboardPaging.setPageBlock(3);
		itemboardPaging.setPageSize(4);
		itemboardPaging.setTotalArticle(totalA);
		itemboardPaging.makePagingHTML();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.addObject("categoryCode", categoryCode);
		mav.addObject("list", list);
		mav.addObject("itemboardPaging", itemboardPaging);
		mav.setViewName("jsonView");
		
		return mav;
	}
	@RequestMapping(value="/getItembasketList.do", method=RequestMethod.POST)
	public ModelAndView getItembasketList(@RequestParam(required=false, defaultValue="") String itemCode,
										  @RequestParam(required=false, defaultValue="1") String pg,
										  @RequestParam(required=false, defaultValue="") String categoryCode,
										  String id,
										  Model model) {
		
		int endNum = Integer.parseInt(pg)*4;
		int startNum = endNum-3;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("categoryCode", categoryCode);
		map.put("itemCode", itemCode);
		map.put("id", id);
		
		List<ItemBasketListDTO> list = itemboardDAO.getItembasketList(map);
		
		//占쏙옙占쏙옙징처占쏙옙
		int totalA = itemboardDAO.getTotalA(map);
		itemboardPaging.setCurrentPage(Integer.parseInt(pg));
		itemboardPaging.setPageBlock(3);
		itemboardPaging.setPageSize(3);
		itemboardPaging.setTotalArticle(totalA);
		itemboardPaging.makePagingHTML();
	
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.addObject("itemCode", itemCode);
		mav.addObject("categoryCode", categoryCode);
		mav.addObject("list", list);
		mav.addObject("itemboardPaging", itemboardPaging);
		mav.setViewName("jsonView");
		return mav;
		
	}
	
	@RequestMapping(value="/itemboardView.do", method=RequestMethod.GET)
	public String itemboardView(@RequestParam String categoryCode,
								@RequestParam String itemCode,
								@RequestParam(required=false, defaultValue="1") String pg,
								Model model) {
		
		ItemboardDTO itemboardDTO = itemboardDAO.getItemboardView(itemCode);
		model.addAttribute("itemboardDTO",itemboardDTO);
		model.addAttribute("categoryCode", categoryCode);
		model.addAttribute("itemCode", itemCode);
		model.addAttribute("title", "상품 보기");
		model.addAttribute("pg", pg);
		model.addAttribute("display", "/itemboard/itemboardView.jsp");
		
		return "/main/index";
	}
	
	@RequestMapping(value="/getItemboardView.do", method=RequestMethod.POST)
	public ModelAndView getItemboardView(@RequestParam String itemCode, @RequestParam String categoryCode, @RequestParam String pg) {
		ItemboardDTO itemboardDTO = itemboardDAO.getItemboardView(itemCode);
		
//		System.out.println("asdasdasdcategoryCode=" +categoryCode );
//		System.out.println("asdasdasditemCode=" + itemCode);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("itemCode", itemCode);
		map.put("categoryCode", categoryCode);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("itemboardDTO", itemboardDTO);
		mav.addObject("map", map);
		mav.setViewName("jsonView");
		return mav;
	}
	//컬러 선택시 사이즈 얻기 
	@RequestMapping(value="/getSize.do",method=RequestMethod.POST)
	public ModelAndView getSize(@RequestParam String itemCode, @RequestParam String color) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("itemCode",itemCode);
		map.put("color",color); 
		ItemboardDTO itemboardDTO = itemboardDAO.getSize(map);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("itemboardDTO",itemboardDTO);
		mav.setViewName("jsonView");
		
		return mav;
		
	}
	
	//�옣諛붽뎄�땲
	@RequestMapping(value="/itemBasket.do", method=RequestMethod.POST)
	@ResponseBody
	public void itemBasket(@ModelAttribute ItemBasketDTO itemBasketDTO,
							@RequestParam String colVal,
							@RequestParam String Id,							
							Model model) {
		String qty = itemBasketDTO.getItemQty();
		String itemCode = itemBasketDTO.getItemCode();
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("colVal", colVal);
		map.put("size",itemBasketDTO.getItemSize());
		map.put("qty",qty);
		map.put("id",Id);
		map.put("itemCode",itemCode);
		map.put("zipcode",itemBasketDTO.getZipcode());
		map.put("addr1",itemBasketDTO.getAddr1());
		map.put("addr2",itemBasketDTO.getAddr2());
		itemboardDAO.qtyChg(map);
		itemboardDAO.setAddimp(map);
	    itemboardDAO.itemBasket(itemBasketDTO);
	}   
	@RequestMapping(value="/itemBasket2.do", method=RequestMethod.POST)
	@ResponseBody
	public void itemBasket2(@RequestParam String colVal,
			@RequestParam String itemCode,
			@RequestParam String itemName,
			@RequestParam String itemCol,
			@RequestParam String itemQty,
			@RequestParam String itemSize,
			@RequestParam String Id,
			@RequestParam String stus,		
							Model model) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("itemCode", itemCode);
		map.put("itemName",itemName);
		map.put("itemCol",itemCol);
		map.put("itemQty",itemQty);
		map.put("itemSize",itemSize);
		map.put("id",Id);
		map.put("stus",stus);
	    itemboardDAO.itemBasket2(map);
	}    
	
	@RequestMapping(value="/basketFlush.do", method=RequestMethod.POST)
	@ResponseBody
	public void basketFlush(@RequestParam String id) {
		
		
		itemboardDAO.basketFlush(id);
		
		
	}	
	@RequestMapping(value="/basketDelete.do", method=RequestMethod.POST)
    @ResponseBody
    public void basketDelete(@RequestParam(value="chkbox[]") List<Integer> seq) {
    	for(int i=0; i<seq.size(); i++) {
    		itemboardDAO.basketDelete(seq.get(i));
    	}
    }
	
	@RequestMapping(value="/itemPurchaseForm.do", method=RequestMethod.POST)
	public String itemPurchaseForm(@RequestParam String colName,
									@RequestParam String sizeName,
									@RequestParam String initQty,
									@RequestParam String salePrice,
									@RequestParam String sumPrice,
									@RequestParam String imgName,
									@RequestParam String itemName,
									@RequestParam String itemCode,
									@RequestParam String colVal,
									Model model) {
		model.addAttribute("title", "구매하기");
		model.addAttribute("itemCode",itemCode);
		model.addAttribute("colVal",colVal);
		model.addAttribute("colName",colName);
		model.addAttribute("itemName",itemName);
		model.addAttribute("imgName",imgName);
		model.addAttribute("sizeName",sizeName);
		model.addAttribute("initQty",initQty);
		model.addAttribute("salePrice",salePrice);
		model.addAttribute("sumPrice",sumPrice);
		model.addAttribute("display", "/itemboard/itemPurchaseForm.jsp");
		return "/main/index";
	}
	
	
	@RequestMapping(value="/getSideBarList.do", method=RequestMethod.POST)
	public ModelAndView getSideBarList(@RequestParam String id) {
		List<ItemBasketListDTO> list = itemboardDAO.getSideBarList(id);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="/SideBarDeleteItem.do", method=RequestMethod.POST)
	@ResponseBody
	public void SideBarDeleteItem(@RequestParam int seq) {
		itemboardDAO.SideBarDeleteItem(seq);
	}
	
	
	@RequestMapping(value="/getStayItemList.do", method=RequestMethod.POST)
	public ModelAndView getStayItemList(@RequestParam String id) {
		List<ItemBasketListDTO> list = itemboardDAO.getStayItemList(id);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="/getIngItemList.do", method=RequestMethod.POST)
	public ModelAndView getIngItemList(@RequestParam String id) {
		List<ItemBasketListDTO> list = itemboardDAO.getIngItemList(id);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="/getReItemList.do", method=RequestMethod.POST)
	public ModelAndView getReItemList(@RequestParam String id) {
		List<ItemBasketListDTO> list = itemboardDAO.getReItemList(id);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="/getEdItemList.do", method=RequestMethod.POST)
	public ModelAndView getEdItemList(@RequestParam String id) {
		List<ItemBasketListDTO> list = itemboardDAO.getEdItemList(id);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="/StayItemDelete.do", method=RequestMethod.POST)
	@ResponseBody
	public void StayItemDelete(@RequestParam String id,
									   @RequestParam int seq,
									   @RequestParam int reCash,
									   HttpSession session) {
		Map<String,String> map = new HashMap<String,String>();
		
		map.put("id", id);
		map.put("seq", seq+""); 
		map.put("reCash", reCash+"");
		
		itemboardDAO.StayItemDelete(map);

		UserDTO userDTO = itemboardDAO.getUserDTO(id);
		
		session.setAttribute("userDTO", userDTO);
	}
	
	@RequestMapping(value="/refundItem.do", method=RequestMethod.POST)
	@ResponseBody
	public void refundItem(@RequestParam int seq) {
		itemboardDAO.refundItem(seq);
	}
	 @RequestMapping(value="/review.do", method=RequestMethod.POST)
	   public String review(@ModelAttribute ReviewDTO reviewDTO,
	                  @RequestParam MultipartFile[] img,
	                  @RequestParam  String itemCodeRev,
	                  Model model) {
	      
	      //filepath 경로 깃 허브 경로로 잡아놓음
	      String filePath = "C:\\Users\\user\\git\\rainbow\\shoppingmall\\src\\main\\webapp\\storage";
	      String fileName;
	      File file;
	      
	      //-----------------------
	      if(img[0]!=null) {
	         fileName = img[0].getOriginalFilename();
	         file = new File(filePath, fileName);
	         try {
	            FileCopyUtils.copy(img[0].getInputStream(), new FileOutputStream(file));
	         } catch (IOException e) {
	            e.printStackTrace();
	         }
	      
	         reviewDTO.setImg1(fileName);
	      }else {
	         reviewDTO.setImg1(null);
	      }
	      //-------------------
	      if(img[1]!=null) {
	         fileName = img[1].getOriginalFilename();
	         file = new File(filePath, fileName);
	         try {
	            FileCopyUtils.copy(img[1].getInputStream(), new FileOutputStream(file));
	         } catch (IOException e) {
	            e.printStackTrace();
	         }
	      
	         reviewDTO.setImg2(fileName);
	      }else {
	         reviewDTO.setImg2(null);
	      }
	      
	      System.out.println(itemCodeRev);
	      
	      itemboardDAO.reviewWrite(reviewDTO);
	      ItemboardDTO itemboardDTO = itemboardDAO.getItemboardView(itemCodeRev);
	      
	      model.addAttribute("itemboardDTO",itemboardDTO);
	      model.addAttribute("itemCode", itemCodeRev);
	      model.addAttribute("display", "/itemboard/itemboardView.jsp");
	      return "/main/index";
	   }

	
	@RequestMapping(value="/orderList.do", method=RequestMethod.POST)
	public ModelAndView orderList(@RequestParam String stus) {
		
		ModelAndView mav = new ModelAndView();
		List<ItemBasketListDTO> list = itemboardDAO.orderList(stus);
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	@RequestMapping(value="/sendItem.do", method=RequestMethod.POST)
    @ResponseBody
    public void sendItem(@RequestParam(value="chkbox[]") List<Integer> seq,
    					 @RequestParam String stus) {
    	for(int i=0; i<seq.size(); i++) {
    		itemboardDAO.sendItem(seq.get(i), stus);
    	}
    }
	
	@RequestMapping(value="/refund.do", method=RequestMethod.POST)
    @ResponseBody
    public void refund(@RequestParam(value="chkbox[]") List<Integer> seq) {
		for(int i=0; i<seq.size(); i++) {
			ItemBasketListDTO itemBasketListDTO = itemboardDAO.getSeqId(seq.get(i));

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", itemBasketListDTO.getId());
			map.put("money", Integer.parseInt(itemBasketListDTO.getItemQty())*itemBasketListDTO.getSalePrice());
			map.put("seq", itemBasketListDTO.getSeq());
			
			itemboardDAO.refund(map);
		}
	}
	
	@RequestMapping(value="/cashCount.do", method=RequestMethod.POST)
	@ResponseBody
	public void cashCount(@RequestParam String sumPrice,
							@RequestParam String Id,
							Model model) {
		System.out.println(sumPrice);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("id",Id);
		map.put("sumPrice",Integer.parseInt(sumPrice));
		itemboardDAO.cashChg(map);
	}    
}
