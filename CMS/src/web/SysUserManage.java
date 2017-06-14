package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.*;
import dao.*;

/**
 * Servlet implementation class SysUserManage
 */
@WebServlet("/SysUserManage")
public class SysUserManage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SysUserManage() {
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
		Integer pageRecordNum=StatusCode.PAGE_RECORDNUM;
		Integer pageNo=1;
		
		if(type==null){
			//�����ݿ��ȡ�����û�,Ĭ����ʾ��һҳ
			SystemUserDAO userdao=new SystemUserDAO();
			SystemUser user=new SystemUser();
			if(request.getParameter("keyName")!=null){
				
				user.SetNickname(new String(request.getParameter("keyName").getBytes("iso-8859-1"),"UTF-8"));
				request.setAttribute("keyName", user.GetNickname());
			}
			if(request.getParameter("pageNo")!=null){
				pageNo=Integer.parseInt(request.getParameter("pageNo"));
			}
			
			ArrayList<IEntity> users=userdao.GetEntitySet(user, pageNo, pageRecordNum);
			ArrayList<String> roles=new ArrayList<String>();
			
			for(int i=0;i<users.size();i++){
				roles.add(((Role)new RoleDAO().GetOneEntity(((SystemUser)users.get(i)).GetRoleNo())).GetName());
			}
			RoleDAO roleDAO= new RoleDAO();
			Role role =  new Role();
			ArrayList<IEntity> all_role=roleDAO.GetEntitySet(role);
			
			
			request.setAttribute("all_role", all_role);
			request.setAttribute("users", users);
			request.setAttribute("roles", roles);
			request.setAttribute("pageNo", pageNo);
			request.setAttribute("pageRecordNum", pageRecordNum);
			request.setAttribute("pageNum", userdao.GetPageNum());
			request.setAttribute("totalRecordNum", userdao.getRecordNum());
			request.getRequestDispatcher("SysUserManage.jsp").forward(request, response);
		}else if(type.equals("add_display")){
			
			ArrayList<IEntity> roles=new RoleDAO().GetEntitySet(new Role());
			ArrayList<String> rolenames=new ArrayList<String>();
			for(int i=0;i<roles.size();i++){
				rolenames.add(((Role)roles.get(i)).GetName());
			}
			request.setAttribute("roles", rolenames);
			request.getRequestDispatcher("AddSysUserInfo.jsp").forward(request, response);
		}else if(type.equals("add_submit")){
			//��ȡ��д��ע����Ϣ
			PrintWriter out=response.getWriter();
			String NewUsername = request.getParameter("NewUsername");
			String NewPassword = request.getParameter("NewPassword");
			String NewNickName = new String(request.getParameter("NewNickName").getBytes("iso-8859-1"),"UTF-8");
			String NewroleName=new String(request.getParameter("NewroleName").getBytes("iso-8859-1"),"UTF-8");
			String NewEmail = request.getParameter("NewEmail");
			String Newtel = request.getParameter("Newtel");
			

			SystemUserDAO sysDao=new SystemUserDAO();
			if(sysDao.GetOneEntity(NewUsername)!=null)
			{
				out.write("�û����Ѵ���");
			}
			else
			{
				RoleDAO roleDAO = new RoleDAO();
				Role role = new Role();
				Role temprole = new Role();
				role.SetName(NewroleName);
				temprole = (Role)roleDAO.GetOneEntity(role);
				
				SystemUserDAO systemUserDAO = new SystemUserDAO();
				SystemUser systemUser = new SystemUser();
				
				systemUser.SetUsername(NewUsername);
				systemUser.SetPassword(NewPassword);
				systemUser.SetNickname(NewNickName);
				systemUser.SetRoleNo(temprole.GetId());
				systemUser.SetEmail(NewEmail);
				systemUser.SetTel(Newtel);
				
				if(systemUserDAO.AddEntity(systemUser))
					out.write("��ӳɹ�");
				else
					out.write("���ʧ��");
				
			}
			
		}else if(type.equals("modify_submit")){
			PrintWriter out=response.getWriter();
			String MNewNickName = new String(request.getParameter("MNewNickName").getBytes("iso-8859-1"),"UTF-8");
			String MRole=new String(request.getParameter("MRole").getBytes("iso-8859-1"),"UTF-8");
			String MNewEmail = request.getParameter("MNewEmail");
			String MNewtel = request.getParameter("MNewtel");
			Integer id=Integer.parseInt(request.getParameter("SysId"));
			
			
			RoleDAO roleDAO = new RoleDAO();
			Role role = new Role();
			Role temprole = new Role();
			role.SetName(MRole);
			temprole = (Role)roleDAO.GetOneEntity(role);
			
			SystemUser systemUser = new SystemUser();
			SystemUserDAO systemUserDAO = new SystemUserDAO();
			systemUser.SetId(id);
			systemUser.SetNickname(MNewNickName);
			systemUser.SetRoleNo((temprole.GetId()));
			systemUser.SetEmail(MNewEmail);
			systemUser.SetTel(MNewtel);
			
			if(systemUserDAO.UpdateEntity(systemUser))
				out.print("�޸ĳɹ�");
			else
				out.print("�޸�ʧ��");
		}else if(type.equals("delete")){
			PrintWriter out=response.getWriter();
			Integer id=Integer.parseInt(request.getParameter("id"));
			
			SystemUser systemUser = new SystemUser();
			SystemUserDAO systemUserDAO = new SystemUserDAO();
			systemUser.SetId(id);
			
			OperateFlowDAO operateFlowDAO = new OperateFlowDAO();
			OperateFlow operateFlow =new OperateFlow();
		    operateFlow.setOperatorNo(id);
		    
		    ArrayList<IEntity> che0=operateFlowDAO.GetEntitySet(operateFlow);
		    
		    operateFlow.setOperateStatus(StatusCode.OPERATESTATUS_NO_READY);
			ArrayList<IEntity> che1=operateFlowDAO.GetEntitySet(operateFlow);
			
			operateFlow.setOperateStatus(StatusCode.OPERATESTATUS_NO_FINISH);
			ArrayList<IEntity> che2=operateFlowDAO.GetEntitySet(operateFlow);
			if(che1.size()>0||che2.size()>0)
				out.write("�ý�ɫ���й���");
			

			else {
				
				if(che0.size()>0){
					if(systemUserDAO.DeleteEntity(systemUser)&&operateFlowDAO.DeleteEntity(operateFlow))
					out.write("ɾ���ɹ�");
				}
				else{
				
				
				if(systemUserDAO.DeleteEntity(systemUser))
					out.write("ɾ���ɹ�");
				else {
					out.write("ɾ��ʧ��");
				}
				}
			}
			
			
		}else if(type.equals("CheckUsername"))
		{
			PrintWriter out=response.getWriter();
			String NewUsername = request.getParameter("NewUsername");
			if(NewUsername!=null){
				SystemUserDAO sysDao=new SystemUserDAO();
				if(sysDao.GetOneEntity(NewUsername)!=null){
					out.write("NO");
				}else{
					out.write("YES");
				}
			}
		}
		
	}

}
