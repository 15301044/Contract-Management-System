package web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.*;
import model.*;

/**
 * Servlet implementation class Regist
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		String Nusername=request.getParameter("NewUsername");
		String Nnickname=request.getParameter("NewNickname");
		String Npassword=request.getParameter("NewPassword");
		String NEmail=request.getParameter("NewEmail");
		String NTel=request.getParameter("NewTel");
		SystemUserDAO userDao=new SystemUserDAO();
		SystemUser Nuser=new SystemUser(0, Nusername,1,Nnickname, Npassword, NEmail, NTel);
	
	    boolean s=userDao.AddEntity(Nuser);
	    if(s==true){
	    	request.setAttribute("result", StatusCode.PROMPT_REGISTER_SUCCESS);
	    }else{
	    	request.setAttribute("result", StatusCode.ERROR_REGISTER_FAILURE);
	    }
	    request.getRequestDispatcher("Login.jsp").forward(request, response);
	    
		
		
		
		
	}

}
