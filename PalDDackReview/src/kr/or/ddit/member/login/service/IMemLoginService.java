package kr.or.ddit.member.login.service;

import java.util.Map;

import kr.or.ddit.utill.vo.MemberVO;

public interface IMemLoginService {
	
	/**
	 * 	로그인 id,pw 검증
	 * @param map id,pw
	 * @return
	 */
	public MemberVO loginCheck(Map<String, Object> map);

}
