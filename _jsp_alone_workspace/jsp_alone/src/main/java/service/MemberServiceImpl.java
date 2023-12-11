package service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import domain.MemberVO;
import repository.MemberDAO;
import repository.MemberDAOImpl;

public class MemberServiceImpl implements MemberService {
	
	private static final Logger log = LoggerFactory.getLogger(MemberServiceImpl.class);
	
	private MemberDAO mdao;
	
	public MemberServiceImpl() {
		mdao = new MemberDAOImpl();
	}

	@Override
	public int register(MemberVO mvo) {
		// TODO Auto-generated method stub
		log.info("register check 2");
		return mdao.register(mvo);
	}

	@Override
	public MemberVO login(MemberVO mvo) {
		// TODO Auto-generated method stub
		log.info("login check 2");
		return mdao.login(mvo);
	}

	@Override
	public int lastlogin(MemberVO mvo) {
		// TODO Auto-generated method stub
		return mdao.lastlogin(mvo);
	}

	@Override
	public int modify(MemberVO mvo) {
		// TODO Auto-generated method stub
		return mdao.modify(mvo);
	}

	@Override
	public List<MemberVO> getList() {
		// TODO Auto-generated method stub
		return mdao.getList();
	}

	@Override
	public int remove(MemberVO mvo) {
		// TODO Auto-generated method stub
		return mdao.remove(mvo);
	}
}
