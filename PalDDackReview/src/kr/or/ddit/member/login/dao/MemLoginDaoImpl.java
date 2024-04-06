package kr.or.ddit.member.login.dao;

import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import config.MyBatisUtil;
import kr.or.ddit.utill.vo.MemberVO;

public class MemLoginDaoImpl implements IMemLoginDao {
	private static IMemLoginDao dao;
	private MemLoginDaoImpl() {}
	
	public static IMemLoginDao getInstance() {
		if(dao==null) {
			dao=new MemLoginDaoImpl();
		}
		return dao;
	}
	@Override
	public MemberVO loginCheck(Map<String, Object> map) {
		SqlSession session = MyBatisUtil.getInstance(true);
		MemberVO mv =null;
		try {
			mv=session.selectOne("member.loginCheck", map);
		} catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return mv;
	}
}
