package kr.or.ddit.member.join.dao;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import config.MyBatisUtil;

public class MemJoinDaoImpl implements IMemJoinDao {
	private static IMemJoinDao dao;
	private MemJoinDaoImpl() {}
	public static IMemJoinDao getInstance() {
		if(dao == null) {
			dao = new MemJoinDaoImpl();
		}
		return dao;
	}
	@Override
	public int idChk(String memId) {
		SqlSession session = MyBatisUtil.getInstance(true);
		int cnt =0;
		try {
			cnt=session.selectOne("join.idChk", memId);
		} catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return cnt;
	}

}
