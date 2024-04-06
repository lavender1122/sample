package kr.or.ddit.member.login.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.member.login.service.IMemLoginService;
import kr.or.ddit.member.login.service.MemLoginServiceImpl;
import kr.or.ddit.utill.vo.MemberVO;

@WebServlet("/logincontroller.do")
public class loginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
		request.getRequestDispatcher("/views/login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memId = request.getParameter("memId");
		String memPw = request.getParameter("memPw");
		
//		System.out.println(memId+":"+ memPw);
		
		//service.logincheck 하기 위해 map rorcp todtjd
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memId",memId);
		map.put("memPw",memPw);
		
		IMemLoginService service = MemLoginServiceImpl.getInstance();
		MemberVO mv = new MemberVO();
		mv = service.loginCheck(map);
//		System.out.println("loginId>>"+mv);
		
		if(mv!=null) { //loginId 값 있다면 
			HttpSession session = request.getSession();
			session.setAttribute("mv", mv);//넘어온 id 정보를  활용
			
		response.sendRedirect("/main.do");//메인으로 감 =>js history.back() 할수 없나?
		
		}
	}

}
