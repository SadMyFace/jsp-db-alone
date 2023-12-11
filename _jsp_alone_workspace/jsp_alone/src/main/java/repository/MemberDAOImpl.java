package repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import domain.MemberVO;
import orm.DatabaseBuilder;

public class MemberDAOImpl implements MemberDAO {
	
	private static final Logger log = LoggerFactory.getLogger(MemberDAOImpl.class);
	
	private SqlSession sql;
	
	public MemberDAOImpl() {
		new DatabaseBuilder();
		sql = DatabaseBuilder.getFactory().openSession();
	}

	@Override
	public int register(MemberVO mvo) {
		// TODO Auto-generated method stub
		log.info("register check 3");
		
		int isOk = sql.insert("MemberMapper.register", mvo);
		
		if(isOk > 0) {
			sql.commit();
		}
		
		return isOk;
	}

	@Override
	public MemberVO login(MemberVO mvo) {
		// TODO Auto-generated method stub
		return sql.selectOne("MemberMapper.login", mvo);
	}

	@Override
	public int lastlogin(MemberVO mvo) {
		// TODO Auto-generated method stub
		int isOk = sql.update("MemberMapper.lastlogin", mvo);
		if(isOk > 0) {
			sql.commit();
		}
		return isOk;
	}

	@Override
	public int modify(MemberVO mvo) {
		// TODO Auto-generated method stub
		int isOk = sql.update("MemberMapper.modify", mvo);
		if(isOk > 0) {
			sql.commit();
		}
		return isOk;
	}

	@Override
	public List<MemberVO> getList() {
		// TODO Auto-generated method stub
		return sql.selectList("MemberMapper.list");
	}

	@Override
	public int remove(MemberVO mvo) {
		// TODO Auto-generated method stub
		int isOk = sql.update("MemberMapper.remove", mvo);
		if(isOk > 0) {
			sql.commit();
		}
		return isOk;
	}
}
