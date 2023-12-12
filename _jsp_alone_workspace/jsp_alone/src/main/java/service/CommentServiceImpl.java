package service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import domain.CommentVO;
import repository.CommentDAO;
import repository.CommentDAOImpl;

public class CommentServiceImpl implements CommentService {
	
	private static final Logger log = LoggerFactory.getLogger(CommentServiceImpl.class);
	private CommentDAO cdao;
	
	public CommentServiceImpl() {
		cdao = new CommentDAOImpl();
	}

	@Override
	public int post(CommentVO cvo) {
		// TODO Auto-generated method stub
		log.info(">>> post check 2");
		return cdao.post(cvo);
	}

	@Override
	public List<CommentVO> getList(int bno) {
		// TODO Auto-generated method stub
		log.info(">>> list check 2");
		return cdao.getList(bno);
	}

	@Override
	public int remove(int cno) {
		// TODO Auto-generated method stub
		log.info(">>> remove check 2");
		return cdao.remove(cno);
	}

	@Override
	public int modify(CommentVO cvo) {
		// TODO Auto-generated method stub
		log.info(">>> modify check 2");
		return cdao.modify(cvo);
	}

	@Override
	public int removeCommet(int bno) {
		// TODO Auto-generated method stub
		log.info("comment remove check 1");
		return cdao.removeComment(bno);
	}
}
