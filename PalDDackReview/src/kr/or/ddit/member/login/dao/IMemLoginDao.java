package kr.or.ddit.member.login.dao;

import java.util.Map;

import kr.or.ddit.utill.vo.MemberVO;

public interface IMemLoginDao {
	/**
	 * 	로그인 id,pw 검증
	 * @param map id,pw
	 * @return
	 */
	public MemberVO loginCheck(Map<String, Object> map);

}
