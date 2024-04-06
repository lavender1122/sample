package kr.or.ddit.member.join.dao;

public class MemJoinDaoImpl implements IMemJoinDao {
	private static IMemJoinDao dao;
	private MemJoinDaoImpl() {}
	public static IMemJoinDao getInstance() {
		if(dao == null) {
			dao = new MemJoinDaoImpl();
		}
		return dao;
	}

}
