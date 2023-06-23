package com.lec.member.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.member.dto.Member;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		process(req,res);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		process(req,res);
	}

	private void process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		HttpSession sess = req.getSession();
		Member member = (Member) sess.getAttribute("login_info");
		
		if(member == null) {
			req.setAttribute("error_message", "로그인상태가 아닙니다. 로그인 후 로그아웃 가능합니다");
		} else {
			sess.invalidate();	//session 종료
		}
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/login_form.jsp");
		dispatcher.forward(req, res);
	}
}
