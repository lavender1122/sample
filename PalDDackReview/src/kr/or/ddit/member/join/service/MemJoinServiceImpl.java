package kr.or.ddit.member.join.service;

import kr.or.ddit.member.join.dao.IMemJoinDao;
import kr.or.ddit.member.join.dao.MemJoinDaoImpl;

public class MemJoinServiceImpl implements IMemJoinService {
	private static IMemJoinService service;
	private static IMemJoinDao dao;
	
	private MemJoinServiceImpl() {
		dao = MemJoinDaoImpl.getInstance();
	}
	public static IMemJoinService getInstance() {
		if(service == null) service = new MemJoinServiceImpl();
		return service;
	}

}
