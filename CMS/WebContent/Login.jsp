<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="model.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
<title>用户登录</title>

<script type="text/javascript">
	var canRegister=true;
	function CheckNull(){
		if(document.getElementById("userName").value==""||document.getElementById("password").value==""){
			alert("用户名或者密码不能为空！");
			return false;
		}else{
			return true;
		}
	}
	
	function checkRNull(){
		var a=document.getElementById("NewUsername").value;
		var b=document.getElementById("NewNickname").value;
		var c=document.getElementById("NewPassword").value;
		var d=document.getElementById("RNewPassword").value;
		//var e=document.getElementById("NewEmail").value;
		
		
		if(a==""||b==""||c==""||d==""){
			alert("信息不完整，* 为必填项！");
			return false;
		}else if(canRegister==false){
			alert("该用户名已存在！");
			return false;
		}else if(document.getElementById("IdRNewPassword")!=document.getElementById("IdNewPassword")){
			alert("密码不一致，请核对");
			document.getElementById("RNewPassword").value="";
			return false;
		}
	}
	
	function RequestForRegister(){
		//nameValid
		if(document.getElementById("NewUsername").value!=""){
			var userRequest=null;
			if(window.XMLHttpRequest){
				userRequest=new XMLHttpRequest();
			}else if(window.ActiveXObject){
				userRequest=new ActiveXObject("Microsoft.XMLHttp");
			}
			
			if(userRequest){
				userRequest.open("get","VerifyRegister?newUsername="+document.getElementById("NewUsername").value,true);
				userRequest.onreadystatechange=function(){
					if(userRequest.readyState==4&&userRequest.status==200){
						//判断ajax返回结果
						if(userRequest.responseText=="YES"){
							canRegister=true;
							document.getElementById("nameValid").innerHTML="用户名可用";
						}else{
							canRegister=false;
							document.getElementById("nameValid").innerHTML="用户名已存在";
						}
					}
				};
				userRequest.send();
			}
		}
	}
	
	function GetNewUsernameFocus(){
		document.getElementById("nameValid").innerHTML="";
		document.getElementById("NewUsername").value="";
	}
	
	function RequestForLogin(){
			var loginRequest=null;
			if(window.XMLHttpRequest){
				loginRequest=new XMLHttpRequest();
			}else if(window.ActiveXObject){
				loginRequest=new ActiveXObject("Microsoft.XMLHttp");
			}
			
			if(loginRequest){
				loginRequest.open("get","VerifyLogin?username="+document.getElementById("userName").value+
										"&password="+document.getElementById("password").value,true);
				
				loginRequest.onreadystatechange=function(){
					if(loginRequest.readyState==4&&loginRequest.status==200){
						//判断ajax返回结果
						if(loginRequest.responseText=="YES"){
							document.getElementById("usernameValid").innerHTML="";
							document.getElementById("passwordValid").innerHTML="";
							return true;
						}else if(loginRequest.responseText=="WRONG_USERNAME"){
							document.getElementById("usernameValid").innerHTML="用户名不存在";
							return false;
						}else if(loginRequest.responseText=="WRONG_PASSWORD"){
							document.getElementById("passwordValid").innerHTML="密码错误";
							return false;
						}else{
							return false;
						}
						
					}
				};
				loginRequest.send();
			}
	}
	
	function GetUsernameFocus(){
		document.getElementById("usernameValid").innerHTML="";
	}
	
	function GetPasswordFocus(){
		document.getElementById("passwordValid").innerHTML="";
	}
	
</script>

</head>
<body>
    <div class="container" >
        <h1>合同管理系统</h1>
        <form class="form-horizontal" role="form" action="Login" method="post" onsubmit="return CheckNull()">
          
          <div class="form-group">
            <div class="col-xs-offset-2 col-xs-8 col-sm-offset-4 col-sm-4">
              <input name="userName" onfocus="GetUsernameFocus()" type="text" class="form-control form-control-white" style="background:rgba(100,100,100,.15);border:1px solid #ffffff" id="userName" placeholder="用户名:">
            </div>
            <label id="usernameValid" style="color:red;"></label>
          </div>
          <div class="form-group">
            <div class="col-xs-offset-2 col-xs-8 col-sm-offset-4 col-sm-4">
              <input name="password" onblur="RequestForLogin()" onfocus="GetPasswordFocus()" type="password" class="form-control form-control-white" style="background:rgba(100,100,100,.15);border:1px solid #ffffff" id="password" placeholder="密   码:">
            </div>
            <label id="passwordValid" style="color:red;"></label>
          </div>
          <%
	          	Integer result=(Integer)request.getAttribute("result");
		        if(result!=null){
		        	out.println("<div class=\"form-group \">");
		        	out.println("<div class=\"col-xs-offset-2 col-xs-8 col-sm-offset-4 col-sm-4\">");
		        	out.println("<div class=\"alert alert-warning alert-dismissable\" style=\"background-color:rgba(255,255,255,0.1); border:0px\">");
		        	out.println("<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>");
		        	if(result==StatusCode.ERROR_NOUSERNAME){
		    			out.println("<strong>错误：&nbsp;&nbsp;</strong>用户名不存在!");
		    		}else if(result==StatusCode.ERROR_WRONGPASSWORD){
		    			out.println("<strong>错误：&nbsp;&nbsp;</strong>密码错误!");
		    		}else if(result==StatusCode.ERROR_NORIGHT){
		    			out.println("<strong>提示：&nbsp;&nbsp;</strong>你还没有权限，等管理员给你分配权限吧!");
		    		}else if(result==StatusCode.PROMPT_LOGIN_OUT){
		    			out.println("<strong>提示：&nbsp;&nbsp;</strong>注销成功!");
		    		}else if(result==StatusCode.ERROR_LOGIN_OUT){
		    			out.println("<strong>警告：&nbsp;&nbsp;</strong>您已经注销登录或者登陆超时，请重新登录!");
		    		}else if(result==StatusCode.PROMPT_REGISTER_SUCCESS){
		    			out.println("<strong>提示：&nbsp;&nbsp;</strong>您已经注册成功，但是还不能登录哦，静待管理员分配权限吧!");
		    		}else if(result==StatusCode.ERROR_LOGIN_OUT){
		    			out.println("<strong>错误：&nbsp;&nbsp;</strong>抱歉，注册失败!");
		    		}
		        	//out.println(result);
		    		out.println("</div></div></div>");
		        }
			  
	      %>
          <div class="form-group">
            <div class="col-xs-offset-2 col-xs-8 col-sm-offset-4 col-sm-4" align="center">
              <button type="submit" class="btn btn-info btn-block" id="登录">登录</button>
              <button class="btn btn btn-info btn-block" data-toggle="modal" data-target="#myModal">注册</button>                
                   
            </div>
          </div>
        </form>
        
      <!-- Modal -->
      <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">                
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">注册成为新用户</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form" action="Register" method="post">
                    <div class="form-group">
                        <label  for="用户名" class="col-sm-3 control-label">用户名：</label>
                        <div class="col-xs-3 col-sm-6">
                          <input  name="NewUsername"  type="text" class="form-control" id="NewUsername" onblur="RequestForRegister()" onfocus="GetNewUsernameFocus()">
                        </div>
                        <label for="用户名" class="col-sm-3 control-label" style="color:#FF0000;text-align:left;">* &nbsp;&nbsp;<label id="nameValid"></label></label>
                        <!-- <label for="用户名" class="col-sm-2 control-label" style="color:#FF0000;text-align:left;">已存在</label> -->
                    </div>
                    <div class="form-group">
                        <label for="昵称" class="col-sm-3 control-label">昵称：</label>
                        <div class="col-xs-3 col-sm-6">
                          <input name="NewNickname" type="text" class="form-control" id="NewNickname">
                        </div>
                        <label for="昵称" class="col-sm-3 control-label" style="color:#FF0000;text-align:left;">*</label>
                    </div>
                    <div class="form-group">
                        <label for="密码" class="col-sm-3 control-label">密码：</label>
                        <div class="col-xs-3 col-sm-6">
                          <input name="NewPassword" type="password" class="form-control" id="NewPassword">
                        </div>
                        <label for="密码" class="col-sm-3 control-label" style="color:#FF0000;text-align:left;">*</label>
                    </div>
                    <div class="form-group">
                        <label  for="重复密码" class="col-sm-3 control-label">重复密码：</label>
                        <div class="col-xs-3 col-sm-6">
                          <input name="RNewPassword" type="password" class="form-control" id="RNewPassword">
                        </div>
                        <label for="重复密码" class="col-sm-3 control-label" style="color:#FF0000;text-align:left;">*</label>
                    </div>
                    <div class="form-group">
                        <label for="邮件" class="col-sm-3 control-label">邮件：</label>
                        <div class="col-xs-3 col-sm-6">
                          <input name="NewEmail" type="text" class="form-control" id="NewEmail">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="电话" class="col-sm-3 control-label">电话：</label>
                        <div class="col-xs-3 col-sm-6">
                          <input name="NewTel" type="text" class="form-control" id="NewTel">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 col-sm-offset-3 control-label" style="color:#FF0000;text-align:left;">*为必填选项</label>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="submit" class="btn btn-info" onclick="return checkRNull()">注册</button>
                    </div>
                   </form>
                  </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
              </div>
         </div><!-- /.modal -->
         <jsp:include page="Footer.jsp"></jsp:include>
      </div>
      
      
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="css/bootstrap_3.0.3/js/jquery-2.0.2.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="css/bootstrap_3.0.3/js/bootstrap.js"></script>
    <script src="css/main_js/supersized.3.2.7.min.js"></script>
    <script src="css/main_js/supersized-init.js"></script>
</body>
</html>