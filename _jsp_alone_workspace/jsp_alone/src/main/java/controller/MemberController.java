package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import domain.MemberVO;
import service.MemberService;
import service.MemberServiceImpl;

@WebServlet("/memb/*")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static final Logger log = LoggerFactory.getLogger(MemberController.class);
    
    private RequestDispatcher rdp;
    private String destPage;
    
    private int isOk;
    private MemberService msv;   
    

    public MemberController() {
        // TODO Auto-generated constructor stub
    	msv = new MemberServiceImpl();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		log.info("로그 정상 작동 확인");
		
		String uri = request.getRequestURI();
		String path = uri.substring(uri.lastIndexOf("/") + 1);
		
		switch (path) {
		case "join" : 
			destPage = "/member/join.jsp";
			break;
		case "register" : 
			try {
				log.info("register check 1");
				String id = request.getParameter("id");
				String pwd = request.getParameter("pwd");
				String email = request.getParameter("email");
				int age = Integer.parseInt(request.getParameter("age"));
				
				MemberVO mvo = new MemberVO(id, pwd, email, age);
				
				isOk = msv.register(mvo);
				
				destPage = "/index.jsp";
			} catch (Exception e) {
				// TODO: handle exception
				log.info("register error");
			}
			break;
		case "login":
			try {
				log.info("login check 1");
				String id = request.getParameter("id");
				String pwd = request.getParameter("pwd");
				
				MemberVO mvo = new MemberVO(id, pwd);
				MemberVO loginMvo = msv.login(mvo);
				
				if(loginMvo != null) {
					HttpSession ses = request.getSession();
					ses.setAttribute("ses", loginMvo);
					ses.setMaxInactiveInterval(10*10);
				}else {
					request.setAttribute("msg_login", -1);
				}
				destPage = "/index.jsp";
			} catch (Exception e) {
				// TODO: handle exception
				log.info("login error");
			}
			break;
		case "logout" : 
			try {
				HttpSession ses = request.getSession();
				MemberVO mvo = (MemberVO) ses.getAttribute("ses");
				
				isOk = msv.lastlogin(mvo);
				ses.invalidate();
				destPage = "/index.jsp";
			} catch (Exception e) {
				// TODO: handle exception
				log.info("logout error");
			}
		case "detail" : 
			destPage = "/member/detail.jsp";
			break;
		case "modify" : 
			try {
				String id = request.getParameter("id");
				String pwd = request.getParameter("pwd");
				String email = request.getParameter("email");
				int age = Integer.parseInt(request.getParameter("age"));
				
				MemberVO mvo = new MemberVO(id, pwd, email, age);
				
				isOk = msv.modify(mvo);
				
				HttpSession ses = request.getSession();
				ses.invalidate();
				
				destPage = "/index.jsp";
			} catch (Exception e) {
				// TODO: handle exception
				log.info("modify error");
			}
			break;
		case "list" : 
			try {
				List<MemberVO> list = msv.getList();
				
				request.setAttribute("list", list);
				
				destPage = "/member/list.jsp";
			} catch (Exception e) {
				// TODO: handle exception
				log.info("list error");
			}
			break;
		case "remove" : 
			try {
				HttpSession ses =request.getSession();
				MemberVO mvo = (MemberVO) ses.getAttribute("ses");
				
				isOk = msv.remove(mvo);
				
				ses.invalidate();
				
				destPage = "/index.jsp";
			} catch (Exception e) {
				// TODO: handle exception
				log.info("remove error");
			}
		default:
			break;
		}
		rdp = request.getRequestDispatcher(destPage);
		rdp.forward(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		service(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		service(request, response);
	}

}
