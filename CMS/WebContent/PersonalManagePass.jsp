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
    %>
    
    <script type="text/javascript">
      function verifyPass(){
    	var userRequest=null;
		if(window.XMLHttpRequest){
			userRequest=new XMLHttpRequest();
		}else if(window.ActiveXObject){
			userRequest=new ActiveXObject("Microsoft.XMLHttp");
		}
		
		if(userRequest){
			userRequest.open("get","PersonalManage?type=modifyPassword&ajax=1&oldpass="+document.getElementById("oldpass").value,true);
			userRequest.onreadystatechange=function(){
				if(userRequest.readyState==4&&userRequest.status==200){
					//判断ajax返回结果
					if(userRequest.responseText=="YES"){
						document.getElementById("prompt").innerHTML="验证密码正确";
					}else{
						document.getElementById("prompt").innerHTML="验证密码错误";
					}
				}
			};
			userRequest.send();
		}
      }
      
      function disappearPrompt(){
    	  document.getElementById("prompt").innerHTML="";
      }
      
      function CheckPass(){
    	  if(document.getElementById("newpass").value!=document.getElementById("passCheck").value){
    		  alert("重新输入的密码与新密码不一致!");
    		  return false;
    	  }
      }
      
      
    </script>
	
</head>
<body>
  <!-- 引用外部页眉    -->
  <%@ include file="Head.jsp"%>
  
  <div class="container-manage">
  	<div class="list-group col-sm-2">
	  <a href="PersonalManage" class="list-group-item activetitle"><h2>个人账户管理</h2></a>
	  <a href="PersonalManage" class="list-group-item bg"><h3>基本信息管理</h3></a>
	  <a href="PersonalManage" class="list-group-item bg active"><h3>安全设置</h3></a>
	</div>

     <div class="panel panel-default col-sm-10 bg"><!--panel start-->
          <div class="panel-body">
            <form class="form-horizontal" role="form" action="PersonalManage?type=modifyPassword" method="post" onsubmit="return CheckPass()">
                <div class="form-group">
                    <label for="原密码" class="col-sm-2 col-sm-offset-2 control-label">原密码：</label>
                    <div class="col-sm-6">
                      <input name="oldpass" type="password" class="form-control" id="oldpass" onfocus="disappearPrompt()" onblur="verifyPass()">  <label id="prompt" style="color:red;"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="新密码" class="col-sm-2 col-sm-offset-2 control-label">新密码：</label>
                    <div class="col-sm-6">
                      <input name="newpass" type="password" class="form-control" id="newpass">
                    </div>
                </div>
                <div class="form-group">
                    <label for="确认新密码" class="col-sm-2 col-sm-offset-2 control-label">确认新密码：</label>
                    <div class="col-sm-6">
                      <input name="passCheck" type="password" class="form-control" id="passCheck">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-2 col-sm-offset-4">
                      <button type="submit" class="btn btn-info btn-block" id="确定">提交</button>                    
                    </div>
                    <div class="col-sm-2">
                      <button type="reset" class="btn btn-info btn-block" id="reset">重置</button>                    
                    </div>
                </div>                                                
            </form>
          </div>
     </div><!--panel over-->
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