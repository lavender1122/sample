package kr.or.ddit.member.join.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.login.dao.MemLoginDaoImpl;
import kr.or.ddit.member.login.service.IMemLoginService;
import kr.or.ddit.member.login.service.MemLoginServiceImpl;

@WebServlet("/idchk.do")
public class idChk extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memId =request.getParameter("memId");
		
		IMemLoginService service = MemLoginServiceImpl.getInstance();
		
		int cnt = service.idChk(memId);
		System.out.println(cnt);
		PrintWriter out = response.getWriter();//idChk.jsp로 데이터 보내는 역할
		
		out.println(cnt);
		
		/* 안됨!
		 * if(cnt == 0) { out.println("0"); }else { out.println("1"); }
		 */
			
	}


}
