<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="model.*" %>

<div class="list-group col-sm-2">
  <a href="SystemManage" class="list-group-item activetitle"><h2>系统管理</h2></a>
  
  <%
    ArrayList<String> right=(ArrayList<String>)session.getAttribute("rightCode");
    for(int i=0;i<right.size();i++){
    	if(right.get(i).equals("FPHT")){
    		out.println("<a id=\"fpht\" href=\"AllocateContract\" class=\"list-group-item bg\"><h3>分配合同</h3></a>");
    	}
    	if(right.get(i).equals("JSGL")){
    		out.println("<a id=\"jsgl\" href=\"RoleManage\" class=\"list-group-item bg\"><h3>角色管理</h3></a>");
    	}
    	if(right.get(i).equals("YHGL")){
    		out.println("<a id=\"yhgl\" href=\"SysUserManage\" class=\"list-group-item bg\"><h3>用户管理</h3></a>");
    	}
    	if(right.get(i).equals("RZGL")){
    		out.println("<a id=\"rzgl\" href=\"LogManage\" class=\"list-group-item bg\"><h3>日志管理</h3></a>");
    	}
    }
  
  %>
</div>

