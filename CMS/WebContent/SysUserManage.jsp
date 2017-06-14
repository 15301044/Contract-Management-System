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
    	ArrayList<SystemUser> users=(ArrayList<SystemUser>)request.getAttribute("users");
        ArrayList<Role> all_role=(ArrayList<Role>)request.getAttribute("all_role");
    	ArrayList<String> roles=(ArrayList<String>)request.getAttribute("roles");
    	String keyName=(String)request.getAttribute("keyName");
	    Integer pageNo=(Integer)request.getAttribute("pageNo");
	    Integer pageNum=(Integer)request.getAttribute("pageNum");
	    Integer pageRecordNum=(Integer)request.getAttribute("pageRecordNum");
	    Integer totalRecordNum=(Integer)request.getAttribute("totalRecordNum");
    %>
	
	<script type="text/javascript">
		function ChangeHref(id){
			
			var newHref=document.getElementById(id).getAttribute("href");
			if(newHref.match("keyName")==null&&newHref.match("#")==null){
				newHref+="&keyName="+document.getElementById("keyName").value;
			}
			document.getElementById(id).setAttribute("href",newHref);
		}
		
		function DeleteSystemUser(id){
			var deleteRequest=null;
			if(window.XMLHttpRequest){
				deleteRequest=new XMLHttpRequest();
			}else if(window.ActiveXObject){
				deleteRequest=new ActiveXObject("Microsoft.XMLHttp");
			}
			
			if(deleteRequest){
				
				deleteRequest.open("get","SysUserManage?type=delete&id="+id,true);
				deleteRequest.onreadystatechange=function(){
					if(deleteRequest.readyState==4&&deleteRequest.status==200){
						//判断ajax返回结果
						alert(deleteRequest.responseText);
						document.location = "SysUserManage";
					}
				};
				deleteRequest.send();
			}
		}
		
		function Add_CheckNull(){
			if(document.getElementById("NewUsername").value=="")
			{
				alert("请填写用户名");
				return false;
			}
			else if(document.getElementById("NewPassword").value==""){
				alert("密码不能为空");
				return false;
			}
			else{
				Add();
				return true;
				
				}
		}
		
		
		function Add(){
			var addRequest=null;
			if(window.XMLHttpRequest)
			{
				addRequest=new XMLHttpRequest();
			}else if(window.ActiveXObject){
				addRequest=new ActiveXObject("Microsoft.XMLHttp");
			}
			
			if(addRequest){
				
				 var NewUsername = document.getElementById("NewUsername").value;
				 var NewPassword = document.getElementById("NewPassword").value;
				 var NewNickName = document.getElementById("NewNickName").value;
				 var obj = document.getElementById("NewroleNames");
	             var NewroleName = obj.options[obj.selectedIndex].text;
	             
				 
				 var NewEmail = document.getElementById("NewEmail").value;
				 var Newtel = document.getElementById("Newtel").value;
				 
				var url="SysUserManage?type=add_submit&NewUsername="+NewUsername+"&NewNickName="+NewNickName+"&NewroleName="+NewroleName+"&NewEmail="+NewEmail+"&Newtel="+Newtel+"&NewPassword="+NewPassword;
				
				addRequest.open("get",url,true);
				addRequest.onreadystatechange=function(){
					if(addRequest.readyState==4&&addRequest.status==200){
						//判断ajax返回结果
							alert(addRequest.responseText);
							document.location ="SysUserManage";
					}else{
						alert("status:"+addRequest.status+"    readyState:"+addRequest.readyState);
					}
				};
				addRequest.send();
			}
		}
		
		function RequestForAdd(){
			//nameValid
			if(document.getElementById("NewUsername").value!=""){
				var userRequest=null;
				if(window.XMLHttpRequest){
					userRequest=new XMLHttpRequest();
				}else if(window.ActiveXObject){
					userRequest=new ActiveXObject("Microsoft.XMLHttp");
				}
				
				if(userRequest){
					var NewUsername = document.getElementById("NewUsername").value;
					
					userRequest.open("get","SysUserManage?type=CheckUsername&NewUsername="+NewUsername,true);
					userRequest.onreadystatechange=function(){
						if(userRequest.readyState==4&&userRequest.status==200){
							//判断ajax返回结果
							if(userRequest.responseText=="YES"){
								document.getElementById("nameValid").innerHTML="用户名可用";
							}else{
								document.getElementById("nameValid").innerHTML="用户名已存在";
							}
						}
					};
					userRequest.send();
				}
			}
		}
		
		
		function Modify(){
			var mRequest=null;
			if(window.XMLHttpRequest)
			{
				mRequest=new XMLHttpRequest();
			}else if(window.ActiveXObject){
				mRequest=new ActiveXObject("Microsoft.XMLHttp");
			}
			
			if(mRequest){
				 var SysId = document.getElementById("Sysid").value;
				 var MNewNickName = document.getElementById("MNewNickName").value;
				 var obj = document.getElementById("MRole");
	             var MRole = obj.options[obj.selectedIndex].text;
				 var MNewEmail = document.getElementById("MNewEmail").value;
				 var MNewtel = document.getElementById("MNewtel").value;
				 
				 var url="SysUserManage?type=modify_submit&MNewNickName="+MNewNickName+"&MRole="+MRole+"&MNewEmail="+MNewEmail+"&MNewtel="+MNewtel+"&SysId="+SysId;
				
				 mRequest.open("get",url,true);
				 mRequest.onreadystatechange=function()
				{
					if(mRequest.readyState==4&&mRequest.status==200)
					{
						//判断ajax返回结果
							alert(mRequest.responseText);
							document.location ="SysUserManage";
					}else
					{
						alert("status:"+addRequest.status+"    readyState:"+addRequest.readyState);
					}
				};
				mRequest.send();
			}
		}
		

	</script>
</head>
<body>
  <%@ include file="Head.jsp"%>
  <script type="text/javascript">
	document.getElementById("xtgl").setAttribute("class","active");
  </script>
   
  <div class="container-manage">
      <!-- 引用系统管理导航栏    -->
      <%@ include file="SystemManageNav.jsp" %>
      <script type="text/javascript">
		document.getElementById("yhgl").setAttribute("class","list-group-item bg active");
      </script>
      
      <div class="panel panel-default col-sm-10 bg"><!--panel start-->
          <div class="panel-heading">
            <h3 class="panel-title">系统用户列表</h3>
          </div>
          <div class="panel-body"><!--panel body start-->
            <form class="form-horizontal" role="form" action="SysUserManage" method="get">            
              <div class="form-group">
                <label for="用户昵称" class="col-sm-2 control-label">用户昵称：</label>
                  <div class="input-group col-sm-4">
                    <input id="keyName" name="keyName" type="text" class="form-control" value="<%if(keyName!=null) out.print(keyName); %>">
                    <span class="input-group-btn">
                        <button type="submit" class="btn btn-default">搜索</button>
                    </span>
                  </div><!-- /input-group -->
              </div>
            </form>
            <table class="table table table-hover table-condensed table-condensed table-white">
                <thead>
                	<th>序号</th>
                    <th>用户名</th>
                    <th>昵称</th>
                    <th>角色</th>
                    <th>电子邮件</th>
                    <th>电话</th>
                    <th>操作</th>
                </thead>
                <tbody>
                  <% if(users!=null){ %>
                  <% for(int i=0;i<users.size();i++){%>
                    <tr>
                        <td><%=users.get(i).GetId()%></td>
                        <td><%=users.get(i).GetUsername()%></td>
                        <td><%=users.get(i).GetNickname()%></td>
                        <td><%=roles.get(i)%></td>
                        <td><%=users.get(i).GetEmail()%></td>
                        <td><%=users.get(i).GetTel()%></td>
                        <td>
                          <a onclick="document.getElementById('MNewNickName').value='<%=users.get(i).GetNickname()%>';
                          			  document.getElementById('MNewEmail').value='<%=users.get(i).GetEmail()%>';
                          			  document.getElementById('MNewtel').value='<%=users.get(i).GetTel()%>';
                          			  document.getElementById('Sysid').value='<%=users.get(i).GetId()%>';
                          			  document.getElementById('ROLE').value='<%=roles.get(i)%>';"
                          			   data-toggle="modal" data-target="#modify_Model">修改</a>&nbsp;&nbsp;
                          <a href="javascript:DeleteSystemUser('<%=users.get(i).GetId()%>')">删除</a>
                        </td>
                    </tr>
                   <%} %>
                   <%} %>
                </tbody>
            </table>
            <form class="form-horizontal" role="form">
	            <div class="form-group">
		          <div class="col-sm-7 col-sm-offset-4">
	                <a id="pageone" onmouseover="ChangeHref('pageone')" class="col-sm-1 col-sm-offset-1" href="<%if(pageNo!=1){out.print("SysUserManage?pageNo=1");}else{out.print("#");}%>"><span class="glyphicon glyphicon-fast-backward myclickstyle"></span></a>
		      	    <a id="pagebefore" onmouseover="ChangeHref('pagebefore')" class="col-sm-1" href="<% if(pageNo>=2){out.print("SysUserManage?pageNo="+(pageNo-1));}else{out.print("#");} %>"><span class="glyphicon glyphicon-arrow-left myclickstyle"></span></a>
		      	    <span class="col-sm-3"><%=pageNo %>/<%=pageNum %>(共 <%=totalRecordNum%> 条)</span>
		      	    <a id="pagenext" onmouseover="ChangeHref('pagenext')" class="col-sm-1" href="<% if(pageNo+1<=pageNum){out.print("SysUserManage?pageNo="+(pageNo+1));}else{out.print("#");} %>"><span class="glyphicon glyphicon-arrow-right myclickstyle"></span></a>
		      	    <a id="pagefinal" onmouseover="ChangeHref('pagefinal')" class="col-sm-1" href="<%if(pageNo!=pageNum){out.print("SysUserManage?pageNo="+pageNum);}else{out.print("#");}%>"><span class="glyphicon glyphicon-fast-forward myclickstyle"></span></a>
		      	    <!--<span>每页<input id="pageRecordNum" type="text" size="3" value="">条</span>-->
		          </div><!--display table page-->
		        </div>
                <div class="form-group">
                  <div class="col-sm-2 col-sm-offset-10">
                    <a class="btn btn-info btn-block" data-toggle="modal" data-target="#add_Modal">增加用户</a>                    
                  </div>                              
                </div>		        
	        </form>
          </div><!--panel body over-->
      </div><!--panel over-->
      <!-- Modal -->
      <div class="modal fade" id="modify_Model" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">                
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">修改用户信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form" action="SysUserManage" method="post">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">昵称：</label><label id="Sysid" style="display:none"></label>
                        <div class="col-xs-3 col-sm-6">
                          <input type="text" class="form-control" id="MNewNickName">
                        </div>
                        <!-- <label for="用户名" class="col-sm-2 control-label" style="color:#FF0000;text-align:left;">已存在</label> -->
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">角色：</label>
                        <div class="col-xs-3 col-sm-6">
							<select class="form-control" name="roleNames" id="MRole">
                        <% for(int i=0;i<all_role.size();i++)
                        {%>      
                        <option><%=all_role.get(i).GetName()%></option>
                        <%} 
                        %>
							</select><label id="ROLE" style="display:none"></label>
						</div>                   
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">电子邮件：</label>
                        <div class="col-xs-3 col-sm-6">
                          <input type="text" class="form-control" id="MNewEmail">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">电话：</label>
                        <div class="col-xs-3 col-sm-6">
                          <input type="text" class="form-control" id="MNewtel">
                        </div>
                    </div>                    
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-info" onclick="Modify()">修改</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>                   
                    </div>
                   </form>
                  </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
              </div>
         </div><!-- /.modal -->  
         
      <!-- Modal2 -->
      <div class="modal fade" id="add_Modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">                
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">增加用户</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">用户名：</label>
                        <div class="col-xs-3 col-sm-6">
                          <input type="text" class="form-control" id="NewUsername" onblur="RequestForAdd()" onfocus="document.getElementById('nameValid').innerHTML='';">
                        </div>
                        <label for="用户名" class="col-sm-3 control-label" style="color:#FF0000;text-align:left;">* &nbsp;&nbsp;<label id="nameValid"></label></label>
                    </div>        
                    <div class="form-group">
                        <label class="col-sm-3 control-label">密码：</label>
                        <div class="col-xs-3 col-sm-6">
                          <input type="text" class="form-control" id="NewPassword">
                        </div>
                        <label for="密码" class="col-sm-3 control-label" style="color:#FF0000;text-align:left;">*</label>
                    </div>        
                    <div class="form-group">
                        <label class="col-sm-3 control-label">昵称：</label>
                        <div class="col-xs-3 col-sm-6">
                          <input type="text" class="form-control" id="NewNickName">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">角色：</label>
						<div class="col-xs-3 col-sm-6">
							<select class="form-control" name="NewroleNames" id="NewroleNames">
                       <% for(int i=0;i<all_role.size();i++)
                        {%>      
                        <option><%=all_role.get(i).GetName()%></option>
                        <%} 
                        %>
							</select>
						</div>				                     
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">电子邮件：</label>
                        <div class="col-xs-3 col-sm-6">
                          <input type="text" class="form-control" id="NewEmail">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">电话：</label>
                        <div class="col-xs-3 col-sm-6">
                          <input type="text" class="form-control" id="Newtel">
                        </div>
                    </div>     
                    <div class="form-group">
                        <label class="col-sm-3 col-sm-offset-3 control-label" style="color:#FF0000;text-align:left;">*为必填选项</label>
                    </div>               
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-info" onclick="return Add_CheckNull()">增加</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>                   
                    </div>
                   </form>
                  </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
              </div>
         </div><!-- /.modal -->           
                     
    </div>
   	<div style="margin-top:600px;"><jsp:include page="Footer.jsp"></jsp:include></div>
  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="css/bootstrap_3.0.3/js/jquery-2.0.2.js"></script>
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="css/bootstrap_3.0.3/js/bootstrap.js"></script>
  <script src="css/main_js/supersized.3.2.7.min.js"></script>
  <script src="css/main_js/supersized-init.js"></script>
</body>
</html>