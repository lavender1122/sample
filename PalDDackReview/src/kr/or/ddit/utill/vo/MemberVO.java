package kr.or.ddit.utill.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberVO {
	private String memId;
	private String memPw;
	private String memName;
	private String memAddr;
	private int memPostNo;
	private String memAddrD;
	private String memEmail;
	private String memTel;
	private String memDelYn;
}
