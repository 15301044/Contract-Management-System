package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.*;
import dao.*;

/**
 * Servlet implementation class RoleManage
 */
@WebServlet("/RoleManage")
public class RoleManage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoleManage() {
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
			//从数据库读取所有角色,默认显示第一页
			RoleDAO roledao=new RoleDAO();
			Role role=new Role();
			if(request.getParameter("keyName")!=null){
				
				role.SetName(new String(request.getParameter("keyName").getBytes("iso-8859-1"),"UTF-8"));
				request.setAttribute("keyName", role.GetName());
			}
			if(request.getParameter("pageNo")!=null){
				pageNo=Integer.parseInt(request.getParameter("pageNo"));
			}
			
			ArrayList<IEntity> roles=roledao.GetEntitySet(role, pageNo, pageRecordNum);
			
			request.setAttribute("roles", roles);
			request.setAttribute("pageNo", pageNo);
			request.setAttribute("pageRecordNum", pageRecordNum);
			request.setAttribute("pageNum", roledao.GetPageNum());
			request.setAttribute("totalRecordNum", roledao.getRecordNum());
			request.getRequestDispatcher("RoleManage.jsp").forward(request, response);
		}else if(type.equals("add_display")){
			request.getRequestDispatcher("AddRole.jsp").forward(request, response);	
		}else if(type.equals("CheckRoleName")){
			
			PrintWriter out=response.getWriter();
			String RoleName=new String(request.getParameter("RoleName").getBytes("iso-8859-1"),"UTF-8");
			if(RoleName!=null){
				RoleDAO roleDAO = new RoleDAO();
				if(roleDAO.GetOneEntity(RoleName)!=null)
				{
					out.write("NO");
				}else{
					out.write("YES");
				
			   }
			}
			
			
			
		}else if(type.equals("add_submit")){
			//接收增加完成之后的值，写入数据库，返回结果
			PrintWriter out=response.getWriter();
			String RoleName=new String(request.getParameter("RoleName").getBytes("iso-8859-1"),"UTF-8");
			String RoleCode=request.getParameter("RoleCode");
			String RoleDescription=new String(request.getParameter("RoleDescription").getBytes("iso-8859-1"),"UTF-8");
			Integer qcht=Integer.parseInt(request.getParameter("qcht"));
			Integer hqht=Integer.parseInt(request.getParameter("hqht"));
			Integer dght=Integer.parseInt(request.getParameter("dght"));
			Integer spht=Integer.parseInt(request.getParameter("spht"));
			Integer qdht=Integer.parseInt(request.getParameter("qdht"));
			Integer htgl=Integer.parseInt(request.getParameter("htgl"));
			Integer htxxcx=Integer.parseInt(request.getParameter("htxxcx"));
			Integer htlccx=Integer.parseInt(request.getParameter("htlccx"));
			Integer cxtj=Integer.parseInt(request.getParameter("cxtj"));
			Integer htxxgl=Integer.parseInt(request.getParameter("htxxgl"));
			Integer khxxgl=Integer.parseInt(request.getParameter("khxxgl"));
			Integer jcsjgl=Integer.parseInt(request.getParameter("jcsjgl"));
			Integer jsgl=Integer.parseInt(request.getParameter("jsgl"));
			Integer yhgl=Integer.parseInt(request.getParameter("yhgl"));
			Integer rzgl=Integer.parseInt(request.getParameter("rzgl"));
			Integer xtgl=Integer.parseInt(request.getParameter("xtgl"));
			
			Role role = new Role();
			Role temp = new Role();
			RoleDAO roleDAO = new RoleDAO();
			role.SetName(RoleName);
			role.SetCode(RoleCode);
			role.SetDescription(RoleDescription);
			
			roleDAO.AddEntity(role);
			
			temp=(Role)roleDAO.GetOneEntity(RoleName);
			
			int id = temp.GetId();
			
			RolePermission rp = new RolePermission();
			RolePermission resrp = new RolePermission();
			RolePermissionDAO rpDao = new RolePermissionDAO();
			
			rp.setRoleNo(id);
			for(int i=1;i<=19;i++)
			{
				rp.setPermissionNo(i);
				rpDao.AddEntity(rp);
			}
			
			if(qcht==0){
				rp.setPermissionNo(7);
				resrp=(RolePermission)rpDao.GetOneEntity(rp);
				rpDao.DeleteEntity(resrp);
			}
			
			if(hqht==0){
				rp.setPermissionNo(8);
				resrp=(RolePermission)rpDao.GetOneEntity(rp);
				rpDao.DeleteEntity(resrp);
			}
			
			if(dght==0){
				rp.setPermissionNo(9);
				resrp=(RolePermission)rpDao.GetOneEntity(rp);
				rpDao.DeleteEntity(resrp);
			}
			
			if(spht==0){
				rp.setPermissionNo(10);
				resrp=(RolePermission)rpDao.GetOneEntity(rp);
				rpDao.DeleteEntity(resrp);
			}
			
			if(qdht==0){
				rp.setPermissionNo(11);
				resrp=(RolePermission)rpDao.GetOneEntity(rp);
				rpDao.DeleteEntity(resrp);
			}
			
			if(htgl==0){
				rp.setPermissionNo(1);
				resrp=(RolePermission)rpDao.GetOneEntity(rp);
				rpDao.DeleteEntity(resrp);
			}
			
			if(htxxcx==0){
				rp.setPermissionNo(12);
				resrp=(RolePermission)rpDao.GetOneEntity(rp);
				rpDao.DeleteEntity(resrp);
			}
			
			if(htlccx==0){
				rp.setPermissionNo(13);
				resrp=(RolePermission)rpDao.GetOneEntity(rp);
				rpDao.DeleteEntity(resrp);
			}
			
			if(cxtj==0){
				rp.setPermissionNo(5);
				resrp=(RolePermission)rpDao.GetOneEntity(rp);
				rpDao.DeleteEntity(resrp);
			}
			
			if(htxxgl==0){
				rp.setPermissionNo(14);
				resrp=(RolePermission)rpDao.GetOneEntity(rp);
				rpDao.DeleteEntity(resrp);
			}
			
			if(khxxgl==0){
				rp.setPermissionNo(15);
				resrp=(RolePermission)rpDao.GetOneEntity(rp);
				rpDao.DeleteEntity(resrp);
			}
			
			if(jcsjgl==0){
				rp.setPermissionNo(6);
				resrp=(RolePermission)rpDao.GetOneEntity(rp);
				rpDao.DeleteEntity(resrp);
			}
			
			if(jsgl==0){
				rp.setPermissionNo(17);
				resrp=(RolePermission)rpDao.GetOneEntity(rp);
				rpDao.DeleteEntity(resrp);
			}
			
			if(yhgl==0){
				rp.setPermissionNo(18);
				resrp=(RolePermission)rpDao.GetOneEntity(rp);
				rpDao.DeleteEntity(resrp);
			}
			
			if(rzgl==0){
				rp.setPermissionNo(19);
				resrp=(RolePermission)rpDao.GetOneEntity(rp);
				rpDao.DeleteEntity(resrp);
			}
			
			if(xtgl==0){
				rp.setPermissionNo(2);
				resrp=(RolePermission)rpDao.GetOneEntity(rp);
				rpDao.DeleteEntity(resrp);
			}
			
			
			out.print("添加成功");
			
		}else if(type.equals("modify_submit")){
			//接收修改完成之后的值，写入数据库，返回结果
			PrintWriter out=response.getWriter();
			Integer roleid=Integer.parseInt(request.getParameter("roleid"));
			String RoleName=new String(request.getParameter("RoleName").getBytes("iso-8859-1"),"UTF-8");
			String RoleCode=request.getParameter("RoleCode");
			String RoleDescription=new String(request.getParameter("RoleDescription").getBytes("iso-8859-1"),"UTF-8");
			Integer qcht=Integer.parseInt(request.getParameter("qcht"));
			Integer hqht=Integer.parseInt(request.getParameter("hqht"));
			Integer dght=Integer.parseInt(request.getParameter("dght"));
			Integer spht=Integer.parseInt(request.getParameter("spht"));
			Integer qdht=Integer.parseInt(request.getParameter("qdht"));
			Integer htgl=Integer.parseInt(request.getParameter("htgl"));
			Integer htxxcx=Integer.parseInt(request.getParameter("htxxcx"));
			Integer htlccx=Integer.parseInt(request.getParameter("htlccx"));
			Integer cxtj=Integer.parseInt(request.getParameter("cxtj"));
			Integer htxxgl=Integer.parseInt(request.getParameter("htxxgl"));
			Integer khxxgl=Integer.parseInt(request.getParameter("khxxgl"));
			Integer jcsjgl=Integer.parseInt(request.getParameter("jcsjgl"));
			Integer jsgl=Integer.parseInt(request.getParameter("jsgl"));
			Integer yhgl=Integer.parseInt(request.getParameter("yhgl"));
			Integer rzgl=Integer.parseInt(request.getParameter("rzgl"));
			Integer xtgl=Integer.parseInt(request.getParameter("xtgl"));
			
			Role role = new Role();
			RoleDAO roleDAO = new RoleDAO();
			role.SetId(roleid);
			role.SetName(RoleName);
			role.SetCode(RoleCode);
			role.SetDescription(RoleDescription);
			if(!roleDAO.UpdateEntity(role))
				out.print("更新失败");
			else{
				RolePermissionDAO rpDao = new RolePermissionDAO();
				
				if(rpDao.ChangeDel(roleid, 7, qcht)&&
				rpDao.ChangeDel(roleid, 8, hqht)&&
				rpDao.ChangeDel(roleid, 9, dght)&&
				rpDao.ChangeDel(roleid, 10,spht)&&
				rpDao.ChangeDel(roleid, 11, qdht)&&
				rpDao.ChangeDel(roleid, 12, htxxcx)&&
				rpDao.ChangeDel(roleid, 13, htlccx)&&
				rpDao.ChangeDel(roleid, 5, cxtj)&&
				rpDao.ChangeDel(roleid, 14, htxxgl)&&
				rpDao.ChangeDel(roleid, 15, khxxgl)&&
				rpDao.ChangeDel(roleid, 6, jcsjgl)&&
				rpDao.ChangeDel(roleid, 17, jsgl)&&
				rpDao.ChangeDel(roleid, 18, yhgl)&&
				rpDao.ChangeDel(roleid, 19, rzgl)&&
				rpDao.ChangeDel(roleid, 2, xtgl)){
					out.print("更新成功");
				}
				
			}
			
			
		}else if(type.equals("delete")){
			//删除指定id的条目，返回结果
			PrintWriter out=response.getWriter();
			Integer id=Integer.parseInt(request.getParameter("id"));
			if(id==1||id==2||id==3){
				out.write("该角色为系统内置，不能被删除！");
			}else {
				SystemUser systemUser = new SystemUser();
				SystemUserDAO systemUserDAO = new SystemUserDAO();
				systemUser.SetRoleNo(id);

				SystemUser temp=(SystemUser)systemUserDAO.GetOneEntity(systemUser);
				if(temp!=null){
					out.write("该角色已被用户使用，请先删除与其相关联的用户！");
				}else{
					RoleDAO  roledao = new RoleDAO();
					Role role = new Role();
					role.SetId(id);
					
					
					//关联删除
					
					
					if(roledao.DeleteEntity(role)){
						
						//写入日志文件
						SimpleDateFormat time=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
						String currTime=time.format(new Date());
						Integer operatorNo=(Integer)request.getSession().getAttribute("id");
						new LogDAO().AddEntity(new Log(0,operatorNo,"删除一个角色，角色编号："+id,currTime));
						//提示删除成功
						out.write("删除成功");
					}else {
						out.write("删除失败");
					}
				
				}
			}
			
		}
			
		
	}

}
