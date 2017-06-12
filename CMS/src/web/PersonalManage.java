package web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.*;
import model.*;

/**
 * Servlet implementation class UserAccountManage
 */
@WebServlet("/PersonalManage")
public class PersonalManage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PersonalManage() {
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
		
		String type=request.getParameter("type");
		if(type==null){
			//��ʾ�����û�ע��ʱ����Ϣ
			HttpSession session=request.getSession();
			SystemUser user=(SystemUser)new SystemUserDAO().GetOneEntity((Integer)session.getAttribute("id"));
			String roleName=((Role)new RoleDAO().GetOneEntity(user.GetRoleNo())).GetName();
			
			request.setAttribute("user", user);
			request.setAttribute("roleName", roleName);
			request.getRequestDispatcher("PersonalManage.jsp").forward(request, response);
		}else if(type.equals("modifyBase")){
			//��ȡ�ύ����Ϣ��д�����ݿ�
			SystemUser newuser=new SystemUser();
			HttpSession session=request.getSession();
			newuser.SetId((Integer)session.getAttribute("id"));
			
			
			if(request.getParameter("username")!=null){
				newuser.SetUsername(request.getParameter("username"));
			}
			if(request.getParameter("nickname")!=null){
				newuser.SetNickname(request.getParameter("nickname"));
				session.setAttribute("nickname", newuser.GetNickname());
			}
			if(request.getParameter("email")!=null){
				newuser.SetEmail(request.getParameter("email"));
			}
			if(request.getParameter("tel")!=null){
				newuser.SetTel(request.getParameter("tel"));
			}
			if(new SystemUserDAO().UpdateEntity(newuser)){
				request.getRequestDispatcher("HomePage.jsp").forward(request, response);
			}else{
				request.getRequestDispatcher("Error.jsp").forward(request, response);
			}
			
		}else if(type.equals("displayPassword")){
			request.getRequestDispatcher("PersonalManagePass.jsp").forward(request, response);
		}else if(type.equals("modifyPassword")){
			String ajax=request.getParameter("ajax");
			if(ajax!=null){
				//����ajax������
				String oldpass=request.getParameter("oldpass");
				HttpSession session=request.getSession();
				SystemUser verify=(SystemUser)new SystemUserDAO().GetOneEntity((Integer)session.getAttribute("id"));
				if(verify!=null){
					if(verify.GetPassword().equals(oldpass)){
						response.getWriter().write("YES");
					}else{
						response.getWriter().write("NO");
					}
				}
			}else{
				
				if(request.getParameter("oldpass")!=null){
					String oldpass=request.getParameter("oldpass");
					SystemUser user=(SystemUser)new SystemUserDAO().GetOneEntity((Integer)request.getSession().getAttribute("id"));
					if(user!=null){
						if(user.GetPassword().equals(oldpass)){
							SystemUser newuser=new SystemUser();
							newuser.SetId((Integer)request.getSession().getAttribute("id"));
							newuser.SetPassword(request.getParameter("newpass"));
							if(new SystemUserDAO().UpdateEntity(newuser)){
								request.setAttribute("result", "��ϲ�ף���������ɹ���");
								request.getRequestDispatcher("Result.jsp").forward(request, response);
							}else{
								request.setAttribute("result", "��Ǹ���Ҳ�֪������������⣬��������ʧ���ˣ�");
								request.getRequestDispatcher("Result.jsp").forward(request, response);
							}
						}else{
							request.setAttribute("result", "ร��ף�ԭ���벻��ȷ������ʧ�ܿ���");
							request.getRequestDispatcher("Result.jsp").forward(request, response);
						}
					}
				}
				
				
				
				
			}
			
			
			
			
		}
		
	}

}
