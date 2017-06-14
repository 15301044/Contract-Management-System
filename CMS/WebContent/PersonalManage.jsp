<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="model.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>合同管理系统</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<link rel="shortcut icon" href="img/title.ico">
	
    <!-- Bootstrap -->
    <link rel="stylesheet" type="text/css" href="css/bootstrap_3.0.3/css/bootstrap.css">
    <link rel="stylesheet" href="css/main_css/supersized.css">
    <link rel="stylesheet" type="text/css" href="css/main_css/main.css">
	
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="http://cdn.bootcss.com/html5shiv/3.7.0/html5shiv.min.js"></script>
        <script src="http://cdn.bootcss.com/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->

    <%
    	SystemUser user=(SystemUser)request.getAttribute("user");
    	String roleName=(String)request.getAttribute("roleName");
    %>
	
</head>
<body>
  <!-- 引用外部页眉    -->
  <%@ include file="Head.jsp"%>
  
  <div class="container-manage">
  	<div class="list-group col-sm-2">
	  <a href="PersonalManage" class="list-group-item activetitle"><h2>个人账户管理</h2></a>
	  <a href="PersonalManage" class="list-group-item bg active"><h3>基本信息管理</h3></a>
	  <a href="PersonalManage?type=displayPassword" class="list-group-item bg"><h3>密码管理</h3></a>
	</div>
	
	<div class="panel panel-default col-sm-10 bg"><!--panel start-->
          <div class="panel-body">
            <form class="form-horizontal" role="form" action="PersonalManage?type=modifyBase" method="post" onsubmit="return checkInfo()">
            	<input name="id" style="visibility:hidden" value="<%=user.GetId()%>">
                <div class="form-group">
                    <label for="用户名" class="col-sm-2 col-sm-offset-2 control-label">用户名：</label>
                    <div class="col-sm-4 control-label" style="text-align:left;">
                      <label><%=user.GetUsername()%></label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="角色" class="col-sm-2 col-sm-offset-2 control-label">角色：</label>
                    <div class="col-sm-4 control-label" style="text-align:left;">
                      <label><%=roleName%></label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="昵称" class="col-sm-2 col-sm-offset-2 control-label">昵称：</label>
                    <div class="col-sm-4">
                      <input name="nickname" type="text" class="form-control" id="nickname" value="<%=user.GetNickname()%>">
                    </div>
                </div>
                <div class="form-group">
                    <label for="邮件" class="col-sm-2 col-sm-offset-2 control-label">邮件：</label>
                    <div class="col-sm-4">
                      <input name="email" type="text" class="form-control" id="email" value="<%=user.GetEmail()%>">
                    </div>
                </div>
                <div class="form-group">
                    <label for="电话" class="col-sm-2 col-sm-offset-2 control-label">电话：</label>
                    <div class="col-sm-4">
                      <input name="tel" type="text" class="form-control" id="tel" value="<%=user.GetTel()%>">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-2 col-sm-offset-4">
                      <button type="submit" class="btn btn-info btn-block" id="modify">修改</button>                    
                    </div>
                    <div class="col-sm-2">
                      <a href="javascript:history.back(-1)" class="btn btn-info btn-block">取消</a>                    
                    </div>
                </div>                               
            </form>
          </div>
     </div><!--panel over--> 
	 <script type="text/javascript">
	 	function checkInfo(){
	 		var nickname=document.getElementById("nickname").value;
	 		var email=document.getElementById("email").value;
	 		if(nickname==""){
	 			alert("昵称不能为空！");
	 			return false;
	 		}
	 		if(email!=""&&email.match("@")==null){
	 			alert("邮件格式不正确！");
	 			return false;
	 		}
	 	}
	 </script>
  </div>
  
  
  <div style="margin-top:550px;"><jsp:include page="Footer.jsp"></jsp:include></div>
  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="css/bootstrap_3.0.3/js/jquery-2.0.2.js"></script>
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="css/bootstrap_3.0.3/js/bootstrap.js"></script>
  <script src="css/main_js/supersized.3.2.7.min.js"></script>
  <script src="css/main_js/supersized-init.js"></script>
</body>
</html>