package kr.or.ddit.member.login.service;

import java.util.Map;

import kr.or.ddit.member.login.dao.IMemLoginDao;
import kr.or.ddit.member.login.dao.MemLoginDaoImpl;
import kr.or.ddit.utill.vo.MemberVO;


public class MemLoginServiceImpl implements IMemLoginService {
	private static IMemLoginService service;
	private static IMemLoginDao dao;
	
	private MemLoginServiceImpl() {
		dao =MemLoginDaoImpl.getInstance();
	}
	public static IMemLoginService getInstance() {
		if(service==null) service = new MemLoginServiceImpl();
		return service;
	}
	@Override
	public MemberVO loginCheck(Map<String, Object> map) {
		return dao.loginCheck(map);
	}
	@Override
	public int idChk(String memId) {
		return dao.idChk(memId);
	};
}
