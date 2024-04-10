package kr.or.ddit.member.join.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.utill.vo.MemberVO;

/**
 * Servlet implementation class join
 */
@WebServlet("/join.do")
public class join extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//	doPost(request, response);
	request.getRequestDispatcher("/views/member/join.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		  String memId= request.getParameter("memId"); 
		  System.out.println("memid>>>>>>>>>>>>" +memId);
//		  String mempw = request.getParameter("mempw");
//		  String memName =request.getParameter("memName"); 
//		  String memTel =request.getParameter("memName")+ request.getParameter("memTel2")+
//				  request.getParameter("memTel3"); 
//		  String memEmail = request.getParameter("memEmail")+ request.getParameter("memEmail1"); 
//		  int deliPostNo = Integer.parseInt(request.getParameter("deliPostNo"));
//		  String deliAddr = request.getParameter("deliAddr"); 
//		  String deliAddrD = request.getParameter("deliAddrD");
//		  MemberVO mv = new MemberVO(); mv.setMemId(memId); mv.setMemPw(mempw);
//		  mv.setMemName(memName); mv.setMemTel(memTel); mv.setMemEmail(memEmail);
//		  mv.setMemPostNo(deliPostNo); mv.setMemAddr(deliAddr);
//		  mv.setMemAddrD(deliAddrD);
		 
		
		
		
	}

}
