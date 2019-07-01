package user.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import user.bean.UserDTO;
import user.dao.UserDAO;
import user.mail.MailService;

@Controller
@RequestMapping(value="/user")
public class UserController {
	@Autowired
	private UserDAO userDAO;
	@Inject
	private PasswordEncoder passwordEncoder;
	@Autowired
	private MailService mailService;
	
	public void serMailService(MailService mailService) {
        this.mailService = mailService;
    }
	
	@RequestMapping(value="/joinForm.do", method=RequestMethod.GET)
	public String joinForm(Model model) {
		model.addAttribute("title","간편 회원가입");
		model.addAttribute("display","/user/joinForm.jsp");
		return "/main/index";
	}
	
	@ResponseBody
	@RequestMapping(value="/checkId.do", method=RequestMethod.POST)
	public String checkId(@RequestParam String id) {
		UserDTO userDTO = userDAO.checkId(id);
		if(userDTO != null) return "exist";
		else return "not_exist";
	}
	
	@RequestMapping(value="/join.do", method=RequestMethod.POST)
	public String join(@ModelAttribute UserDTO userDTO, Model model, HttpSession session) {
		userDTO.setPwd(passwordEncoder.encode(userDTO.getPwd())); //패스워드 암호화
		
		//DB
		userDAO.join(userDTO);
		userDTO = userDAO.checkId(userDTO.getId());
		
		//회원가입 하자마자 로그인되게끔 세션에 등록
		session.setAttribute("userDTO", userDTO);

		model.addAttribute("title", "회원가입 성공");
		model.addAttribute("display", "/user/join.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value="/loginForm.do", method=RequestMethod.GET)
	public String loginForm(Model model) {
		model.addAttribute("title", "회원 로그인");
		model.addAttribute("display", "/user/loginForm.jsp");
		return "/main/index";
	}
	


	@ResponseBody
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String login(@RequestParam String id, @RequestParam String pwd, HttpSession session) {
		String repwd = userDAO.pwdCheck(id);	// 데이터베이스에서 해당 비밀번호를 가지고 옴
		
		if(passwordEncoder.matches(pwd, repwd)) { //인코더를 이용하여 암호화된 비밀번호와 비교, true or false를 반환
			userDAO.grade(id); //등급조정
			session.setAttribute("userDTO", userDAO.login(id)); //해당 아이디 정보를 가져와서 세션에 저장
			return "loginOk";
		}else {
			return "loginFail";
		}
	}
	
	@RequestMapping(value="/logout.do", method=RequestMethod.GET)
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		return new ModelAndView("redirect:/main/index.do");
	}
	
	@RequestMapping(value="/myPageForm.do", method=RequestMethod.GET)
	public String myPageForm(Model model) {
		model.addAttribute("title", "마이 페이지");
		model.addAttribute("display","/user/myPageForm.jsp");
		return "/main/index";
	}
	@RequestMapping(value="/modifyCheckForm.do", method=RequestMethod.GET)
	public String modifyCheckForm(Model model) {
		model.addAttribute("title", "본인확인");
		model.addAttribute("display","/user/modifyCheckForm.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value="/modifyForm.do", method=RequestMethod.GET)
	public String modifyForm(Model model) {
		model.addAttribute("title", "내 정보 수정");
		model.addAttribute("display","/user/modifyForm.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value="/modify.do", method=RequestMethod.POST)
	public String modify(@ModelAttribute UserDTO userDTO, Model model, HttpSession session) {
		userDTO.setPwd(passwordEncoder.encode(userDTO.getPwd())); //패스워드 암호화
		
		//DB
		userDAO.modify(userDTO);
		userDTO = userDAO.checkId(userDTO.getId());
		
		//회원가입 하자마자 로그인되게끔 세션에 등록
		session.setAttribute("userDTO", userDTO);

		model.addAttribute("title", "내 정보 수정 성공");
		model.addAttribute("display", "/user/modifyOk.jsp");
		return "/main/index";
	}
	
	//아이디&비밀번호찾기페이지요청
	@RequestMapping(value="/findForm.do", method=RequestMethod.GET)
	public String FindInfo(Model model) {
		model.addAttribute("display", "/user/findForm.jsp");
		return "/main/index";
	}
	
	//아이디찾기 
	@RequestMapping(value="/findId.do", method=RequestMethod.POST)
	@ResponseBody
	public String FindId(@RequestParam String name,@RequestParam String email) {
		UserDTO userDTO = userDAO.findId(name,email);
		
		
		if(userDTO!=null) {
			return userDTO.getId();
		}else
			return "findFail";
	}
	
	//비밀번호 찾기 누를때 있는계정인지 확인
	@RequestMapping(value="/findPWD_mail.do", method=RequestMethod.POST)
	@ResponseBody
	public String findpwd(@RequestParam String id,@RequestParam String email) {
		System.out.print("이메일인증");
		Map<String,String> map = new HashMap<String,String>();
		map.put("id", id);
		map.put("email", email);
		UserDTO userDTO = userDAO.findPwd(map);/// 있는계정이
		
		if(userDTO!=null) {
			//인증코드
			System.out.println("인증코드첫번째");
			int ran = new Random().nextInt(100000) + 10000;
			String password = ran+"";
			userDTO.setPwd(passwordEncoder.encode(password)); //패스워드 암호화
			userDAO.updatePassword(userDTO);//  비밀번호변경
			
			System.out.print(userDTO.getPwd());
			
			String subject = "임시번호 발급 안내입니다";
			StringBuilder sb = new StringBuilder();
			sb.append("귀하의 임시 비밀번호는 " +password+" 입니다");	
	
			mailService.send(subject,sb.toString(),"slaqhd4@naver.com",email,null);
			
			return "send";
		}else 
			return "fail";
	}
}