<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="model.*" %>


<%
    	boolean htgl=false;
    	boolean xtgl=false;
    	boolean cxtj=false;
    	boolean jcsjgl=false;
    	boolean grgl=false;
    	
    	String username=(String)session.getAttribute("username");
		String nickname=(String)session.getAttribute("nickname");
    	ArrayList<String> rightCode=(ArrayList<String>)session.getAttribute("rightCode");
    	
    	//如果session没有东西，说明没有登录，则跳转到登录界面
    	if(username==null){
    		request.setAttribute("result", StatusCode.ERROR_LOGIN_OUT);
    		request.getRequestDispatcher("Login.jsp").forward(request, response);
    	}
    	
	    if(rightCode!=null){
	    	for(int i=0;i<rightCode.size();i++){
				if(rightCode.get(i).equals("HTGL")){
					htgl=true;
				}
				if(rightCode.get(i).equals("XTGL")){
					xtgl=true;
				}
				if(rightCode.get(i).equals("CXTJ")){
					cxtj=true;
				}
				if(rightCode.get(i).equals("JCSJGL")){
					jcsjgl=true;
				}
				if(rightCode.get(i).equals("GRGL")){
					grgl=true;
				}
			}
	    }
	    
    %>
  <div class="navbar navbar-inverse">
    <div class="container">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="HomePage">合同管理系统</a>
      </div>
      <div class="navbar-collapse collapse">
        <ul class="nav navbar-nav">
          <li id="index"><a href="HomePage">首页</a></li>
          <%
	        if(htgl)
	    		out.println("<li id=\"htgl\"><a href=\"ContractManage\">合同管理</a></li>");
            if(cxtj)
	        	out.println("<li id=\"cxtj\"><a href=\"QueryStatistics\">查询统计</a></li>");
            if(jcsjgl)
	        	out.println("<li id=\"jcsjgl\"><a href=\"BaseDataManage\">基础数据管理</a></li>");
	        if(xtgl)
	        	out.println("<li id=\"xtgl\"><a href=\"SystemManage\">系统管理</a></li>");
          %>
        
        </ul>
        <ul class="nav navbar-nav navbar-right">
        	<li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;<%=nickname %>&nbsp;&nbsp;<b class="caret"></b></a>
            <ul class="dropdown-menu">
              <%
              	if(grgl)
                	out.println("<li id=\"grgl\"><a href=\"PersonalManage\">个人管理</a></li>");
              %>
              <!--<li class="divider"></li>
              <li class="dropdown-header">Nav header</li>-->
              <li><a href="Logout?">注销</a></li>
            </ul>
          </li>
        </ul>
      </div><!--/.nav-collapse -->
    </div>
  </div>