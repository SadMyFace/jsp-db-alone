package service;

import java.util.List;

import domain.MemberVO;

public interface MemberService {

	int register(MemberVO mvo);

	MemberVO login(MemberVO mvo);

	int lastlogin(MemberVO mvo);

	int modify(MemberVO mvo);

	List<MemberVO> getList();

	int remove(MemberVO mvo);

}
