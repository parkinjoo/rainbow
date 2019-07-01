package manager.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

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

import itemboard.bean.ItemboardDTO;
import manager.dao.ManagerDAO;
import user.bean.UserDTO;

@Controller
@RequestMapping(value = "/manager")
public class ManagerController {

	//매니저컨트롤러는 반드시 managerDAO 만 사용 userDAO 삭제
	@Autowired
	private ManagerDAO managerDAO;

	@RequestMapping(value = "/managerPage.do", method = RequestMethod.GET)
	public String writeForm(Model model) {
		model.addAttribute("title", "관리자 페이지");
		model.addAttribute("managerUserDisplay", "/manager/userManagement.jsp");
		model.addAttribute("managerItemDisplay", "/manager/itemManagement.jsp");
		model.addAttribute("modalPageDisplay", "/manager/modalPage.jsp");
		model.addAttribute("display", "/manager/managerPage.jsp");
		return "/main/index";
	}

	@RequestMapping(value = "/getUserList.do")
	public ModelAndView userList() {
		ModelAndView mav = new ModelAndView();
		List<UserDTO> list = managerDAO.getUserList();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value = "/getUserInfo.do")
	@ResponseBody
	public void getUserInfo(@RequestParam String id) {
		System.out.println(id);
	}

	
    @RequestMapping(value="/userDelete.do", method=RequestMethod.POST)
    @ResponseBody
    public void userDelete(@RequestParam(value="chkbox[]") List<String> id) {
    	for(int i=0; i<id.size(); i++) {
    		managerDAO.userDelete(id.get(i));
    	}
    }

	@RequestMapping(value="/itemboardWrite.do", method=RequestMethod.POST)
	public String itemboardWrite(@ModelAttribute ItemboardDTO itemboardDTO, @RequestParam MultipartFile[] img, Model model) {
		//filePath 이 부분 통힐하기 전까지 각자 설정하셔야 해요
		String filePath = "C:\\Spring\\project\\shoppingmall\\src\\main\\webapp\\storage";
		String fileName;
		File file;
		
		//-----------------------
		System.out.println(img.length);
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
		
		managerDAO.itemboardWrite(itemboardDTO);
		model.addAttribute("title", "관리자 페이지");
		model.addAttribute("managerUserDisplay", "/manager/userManagement.jsp");
		model.addAttribute("managerItemDisplay", "/manager/itemManagement.jsp");
		model.addAttribute("modalPageDisplay", "/manager/modalPage.jsp");
		model.addAttribute("display", "/manager/managerPage.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value = "/getItemboardList.do")
	public ModelAndView getItemboardList() {
		ModelAndView mav = new ModelAndView();
		List<ItemboardDTO> list = managerDAO.getItemboardList();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}

}