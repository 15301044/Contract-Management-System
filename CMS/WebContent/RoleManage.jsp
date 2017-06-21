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
    	ArrayList<Role> roles=(ArrayList<Role>)request.getAttribute("roles");
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
		
		function DeleteRole(id){
			var deleteRequest=null;
			if(window.XMLHttpRequest){
				deleteRequest=new XMLHttpRequest();
			}else if(window.ActiveXObject){
				deleteRequest=new ActiveXObject("Microsoft.XMLHttp");
			}
			
			if(deleteRequest){
				
				deleteRequest.open("get","RoleManage?type=delete&id="+id,true);
				deleteRequest.onreadystatechange=function(){
					if(deleteRequest.readyState==4&&deleteRequest.status==200){
						//判断ajax返回结果
						alert(deleteRequest.responseText);
						document.location = "RoleManage";
					}
				};
				deleteRequest.send();
			}
		}
		
		function RequestForAddName(){
			//nameValid
			if(document.getElementById("RoleName").value!=""){
				var userRequest=null;
				if(window.XMLHttpRequest){
					userRequest=new XMLHttpRequest();
				}else if(window.ActiveXObject){
					userRequest=new ActiveXObject("Microsoft.XMLHttp");
				}
				
				if(userRequest){
					var RoleName = document.getElementById("RoleName").value;
					
					userRequest.open("get","RoleManage?type=CheckRoleName&RoleName="+RoleName,true);
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
		
		function Add()
		{
			var RoleName = document.getElementById("RoleName").value;
			var RoleCode = document.getElementById("RoleCode").value;
			var RoleDescription = document.getElementById("RoleDescription").value;
			
			 var check11= document.getElementById("check11");
			 if(check11.checked==true)
				 var qcht = 1;
			 else
				 var qcht = 0;
			 
			 var check12= document.getElementById("check12");
			 if(check12.checked==true)
				 var hqht = 1;
			 else
				 var hqht = 0;
			 
			 var check13= document.getElementById("check13");
			 if(check13.checked==true)
				 var dght = 1;
			 else
				 var dght = 0;
			 
			 var check14= document.getElementById("check14");
			 if(check14.checked==true)
				 var spht = 1;
			 else
				 var spht = 0;
			 
			 var check15= document.getElementById("check15");
			 if(check15.checked==true)
				 var qdht = 1;
			 else
				 var qdht = 0;
			 
			 var checkall1=document.getElementById("checkall1");
			 if(checkall1.checked==true)
				 var htgl=1;
			 else
				 var htgl = 0;
			 
			 var check21= document.getElementById("check21");
			 if(check21.checked==true)
				 var htxxcx = 1;
			 else
				 var htxxcx = 0;
			 
			 var check22= document.getElementById("check22");
			 if(check22.checked==true)
				 var htlccx = 1;
			 else
				 var htlccx = 0;
			 
	         var checkall2=document.getElementById("checkall2");
			 if(checkall2.checked==true)
				 var cxtj = 1;
			 else
				 var cxtj = 0;
			 
			 var check31= document.getElementById("check31");
			 if(check31.checked==true)
				 var htxxgl = 1;
			 else
				 var htxxgl = 0;
			 
			 var check32= document.getElementById("check32");
			 if(check32.checked==true)
				 var khxxgl = 1;
			 else
				 var khxxgl = 0;
			 
			 var checkall3=document.getElementById("checkall3");
			 if(checkall3.checked==true)
				 var jcsjgl = 1;
			 else
				 var jcsjgl = 0;
			 
			 var check41= document.getElementById("check41");
			 if(check41.checked==true)
				 var fpht = 1;
			 else
				 var fpht = 0;
			 
			 var check42= document.getElementById("check42");
			 if(check42.checked==true)
				 var jsgl = 1;
			 else
				 var jsgl = 0;
			 
			 var check43= document.getElementById("check43");
			 if(check43.checked==true)
				 var yhgl = 1;
			 else
				 var yhgl = 0;
			 
			 var check44= document.getElementById("check44");
			 if(check44.checked==true)
				 var rzgl = 1;
			 else
				 var rzgl = 0;
			 
	         var checkall4=document.getElementById("checkall4");
			 if(checkall4.checked==true)
				 var xtgl = 1;
			 else
				 var xtgl = 0;
			 
			 
			 var addRequest=null;
				if(window.XMLHttpRequest){
					addRequest=new XMLHttpRequest();
				}else if(window.ActiveXObject){
					addRequest=new ActiveXObject("Microsoft.XMLHttp");
				}
				
				if(addRequest){
					
					
					var url = "RoleManage?type=add_submit&RoleName="+RoleName+"&RoleCode="+RoleCode
							  +"&RoleDescription="+RoleDescription+"&qcht="+qcht+"&hqht="+hqht+"&dght="+dght
							  +"&spht="+spht+"&qdht="+qdht+"&htgl="+htgl+"&htxxcx="+htxxcx+"&htlccx="+htlccx
							  +"&cxtj="+cxtj+"&htxxgl="+htxxgl+"&khxxgl="+khxxgl+"&jcsjgl="+jcsjgl+"&fpht="+fpht
							  +"&jsgl="+jsgl+"&yhgl="+yhgl+"&rzgl="+rzgl+"&xtgl="+xtgl
					addRequest.open("get",url,true);
					addRequest.onreadystatechange=function(){
						if(addRequest.readyState==4&&addRequest.status==200){
							//判断ajax返回结果
							alert(addRequest.responseText);
							document.location = "RoleManage";
						}
					};
					addRequest.send();
				}
			
		}
		
		
		
		function checkAllBox1(obj){
			 var check11= document.getElementById("check11");
			 var check12= document.getElementById("check12");
			 var check13= document.getElementById("check13");
			 var check14= document.getElementById("check14");
			 var check15= document.getElementById("check15");
			 
			 if(obj.checked==true){
				 check11.checked = true;
				 check12.checked = true;
				 check13.checked = true;
				 check14.checked = true;
				 check15.checked = true;
			 }else{

				 check11.checked = false;
				 check12.checked = false;
				 check13.checked = false;
				 check14.checked = false;
				 check15.checked = false;
			  
			 }
			}
		
		function checkAllBox2(obj){
			 var check21= document.getElementById("check21");
			 var check22= document.getElementById("check22");
			 
			 if(obj.checked==true){
				 check21.checked = true;
				 check22.checked = true;
			 }else{

				 check21.checked = false;
				 check22.checked = false;
			  
			 }
			}
		
		function checkAllBox3(obj){
			 var check31= document.getElementById("check31");
			 var check32= document.getElementById("check32");
			 
			 if(obj.checked==true){
				 check31.checked = true;
				 check32.checked = true;
			 }else{

				 check31.checked = false;
				 check32.checked = false;
			  
			 }
			}
		
		function checkAllBox4(obj){
			 var check41= document.getElementById("check41");
			 var check42= document.getElementById("check42");
			 var check43= document.getElementById("check43");
			 var check44= document.getElementById("check44");
			 
			 if(obj.checked==true){
				 check41.checked = true;
				 check42.checked = true;
				 check43.checked = true;
				 check44.checked = true;
			 }else{

				 check41.checked = false;
				 check42.checked = false;
				 check43.checked = false;
				 check44.checked = false;
			  
			 }
			}
		
		
		
  		function check1(obj)
  		{
			 var check11= document.getElementById("check11");
			 var check12= document.getElementById("check12");
			 var check13= document.getElementById("check13");
			 var check14= document.getElementById("check14");
			 var check15= document.getElementById("check15");
  			
  			
            var checkall1=document.getElementById("checkall1");
              if(obj.checked==true)
                  checkall1.checked = true;
              else if(check11.checked==false&&check12.checked==false&&check13.checked==false&&check14.checked==false&&check15.checked==false)
            	  checkall1.checked = false;
      	}
  		
  		function check2(obj)
  		{
  			
			 var check21= document.getElementById("check21");
			 var check22= document.getElementById("check22");
			 
            var checkall2=document.getElementById("checkall2");
              if(obj.checked==true)
                  checkall2.checked = true;
              else if(check21.checked==false&&check22.checked==false)
                  checkall2.checked = false;
      	}
  		
  		function check3(obj)
  		{
			 var check31= document.getElementById("check31");
			 var check32= document.getElementById("check32");
  			
             var checkall3=document.getElementById("checkall3");
              if(obj.checked==true)
                  checkall3.checked = true;
              else if(check31.checked==false&&check32.checked==false)
                  checkall3.checked = false;
      	}
  		
  		function check4(obj)
  		{
			 var check41= document.getElementById("check41");
			 var check42= document.getElementById("check42");
			 var check43= document.getElementById("check43");
			 var check44= document.getElementById("check44");
			 
            var checkall4=document.getElementById("checkall4");
              if(obj.checked==true)
                  checkall4.checked = true;
              else if(check41.checked==false&&check42.checked==false&&check43.checked==false&&check44.checked==false)
                  checkall4.checked = false;
      	}
  		
  		
  		
  		
  		function Modify()
		{
  			var roleid = document.getElementById("Roleid").value;
			var MNewNickName = document.getElementById("MNewNickName").value;
			var MNewCode = document.getElementById("MNewCode").value;
			var MNewDes = document.getElementById("MNewDes").value;
			
			 var check11= document.getElementById("mcheck11");
			 if(check11.checked!=true)
				 var qcht = 1;
			 else
				 var qcht = 0;
			 
			 var check12= document.getElementById("mcheck12");
			 if(check12.checked!=true)
				 var hqht = 1;
			 else
				 var hqht = 0;
			 
			 var check13= document.getElementById("mcheck13");
			 if(check13.checked!=true)
				 var dght = 1;
			 else
				 var dght = 0;
			 
			 var check14= document.getElementById("mcheck14");
			 if(check14.checked!=true)
				 var spht = 1;
			 else
				 var spht = 0;
			 
			 var check15= document.getElementById("mcheck15");
			 if(check15.checked!=true)
				 var qdht = 1;
			 else
				 var qdht = 0;
			 
			 var checkall1=document.getElementById("mcheckall1");
			 if(checkall1.checked!=true)
				 var htgl=1;
			 else
				 var htgl = 0;
			 
			 var check21= document.getElementById("mcheck21");
			 if(check21.checked!=true)
				 var htxxcx = 1;
			 else
				 var htxxcx = 0;
			 
			 var check22= document.getElementById("mcheck22");
			 if(check22.checked!=true)
				 var htlccx = 1;
			 else
				 var htlccx = 0;
			 
	         var checkall2=document.getElementById("mcheckall2");
			 if(checkall2.checked!=true)
				 var cxtj = 1;
			 else
				 var cxtj = 0;
			 
			 var check31= document.getElementById("mcheck31");
			 if(check31.checked!=true)
				 var htxxgl = 1;
			 else
				 var htxxgl = 0;
			 
			 var check32= document.getElementById("mcheck32");
			 if(check32.checked!=true)
				 var khxxgl = 1;
			 else
				 var khxxgl = 0;
			 
			 var checkall3=document.getElementById("mcheckall3");
			 if(checkall3.checked!=true)
				 var jcsjgl = 1;
			 else
				 var jcsjgl = 0;
			 
			 var check41= document.getElementById("mcheck41");
			 if(check41.checked!=true)
				 var fpht = 1;
			 else
				 var fpht = 0;
			 
			 var check42= document.getElementById("mcheck42");
			 if(check42.checked!=true)
				 var jsgl = 1;
			 else
				 var jsgl = 0;
			 
			 var check43= document.getElementById("mcheck43");
			 if(check43.checked!=true)
				 var yhgl = 1;
			 else
				 var yhgl = 0;
			 
			 var check44= document.getElementById("mcheck44");
			 if(check44.checked!=true)
				 var rzgl = 1;
			 else
				 var rzgl = 0;
			 
	         var checkall4=document.getElementById("mcheckall4");
			 if(checkall4.checked!=true)
				 var xtgl = 1;
			 else
				 var xtgl = 0;
			 
			 
			 var addRequest=null;
				if(window.XMLHttpRequest){
					addRequest=new XMLHttpRequest();
				}else if(window.ActiveXObject){
					addRequest=new ActiveXObject("Microsoft.XMLHttp");
				}
				
				if(addRequest){
					
					
					var url = "RoleManage?type=modify_submit&RoleName="+MNewNickName+"&RoleCode="+MNewCode
							  +"&RoleDescription="+MNewDes+"&qcht="+qcht+"&hqht="+hqht+"&dght="+dght
							  +"&spht="+spht+"&qdht="+qdht+"&htgl="+htgl+"&htxxcx="+htxxcx+"&htlccx="+htlccx
							  +"&cxtj="+cxtj+"&htxxgl="+htxxgl+"&khxxgl="+khxxgl+"&jcsjgl="+jcsjgl+"&fpht="+fpht
							  +"&jsgl="+jsgl+"&yhgl="+yhgl+"&rzgl="+rzgl+"&xtgl="+xtgl+"&roleid="+roleid
					addRequest.open("get",url,true);
					addRequest.onreadystatechange=function(){
						if(addRequest.readyState==4&&addRequest.status==200){
							//判断ajax返回结果
							alert(addRequest.responseText);
							document.location = "RoleManage";
						}
					};
					addRequest.send();
				}
			
		}
  		
  		
  		
  		
  		
  		
  		
  	
  		function mcheckAllBox1(obj){
			 var mcheck11= document.getElementById("mcheck11");
			 var mcheck12= document.getElementById("mcheck12");
			 var mcheck13= document.getElementById("mcheck13");
			 var mcheck14= document.getElementById("mcheck14");
			 var mcheck15= document.getElementById("mcheck15");
			 
			 if(obj.checked==true){
				 mcheck11.checked = true;
				 mcheck12.checked = true;
				 mcheck13.checked = true;
				 mcheck14.checked = true;
				 mcheck15.checked = true;
			 }else{

				 mcheck11.checked = false;
				 mcheck12.checked = false;
				 mcheck13.checked = false;
				 mcheck14.checked = false;
				 mcheck15.checked = false;
			  
			 }
			}
		
		function mcheckAllBox2(obj){
			 var mcheck21= document.getElementById("mcheck21");
			 var mcheck22= document.getElementById("mcheck22");
			 
			 if(obj.checked==true){
				 mcheck21.checked = true;
				 mcheck22.checked = true;
			 }else{

				 mcheck21.checked = false;
				 mcheck22.checked = false;
			  
			 }
			}
		
		function mcheckAllBox3(obj){
			 var mcheck31= document.getElementById("mcheck31");
			 var mcheck32= document.getElementById("mcheck32");
			 
			 if(obj.checked==true){
				 mcheck31.checked = true;
				 mcheck32.checked = true;
			 }else{

				 mcheck31.checked = false;
				 mcheck32.checked = false;
			  
			 }
			}
		
		function mcheckAllBox4(obj){
			 var mcheck41= document.getElementById("mcheck41");
			 var mcheck42= document.getElementById("mcheck42");
			 var mcheck43= document.getElementById("mcheck43");
			 var mcheck44= document.getElementById("mcheck44");
			 
			 if(obj.checked==true){
				 mcheck41.checked = true;
				 mcheck42.checked = true;
				 mcheck43.checked = true;
				 mcheck44.checked = true;
			 }else{

				 mcheck41.checked = false;
				 mcheck42.checked = false;
				 mcheck43.checked = false;
				 mcheck44.checked = false;
			  
			 }
			}
		
		
		
 		function mcheck1(obj)
 		{
			 var mcheck11= document.getElementById("mcheck11");
			 var mcheck12= document.getElementById("mcheck12");
			 var mcheck13= document.getElementById("mcheck13");
			 var mcheck14= document.getElementById("mcheck14");
			 var mcheck15= document.getElementById("mcheck15");
 			
 			
           var mcheckall1=document.getElementById("mcheckall1");
             if(obj.checked==true)
                 mcheckall1.checked = true;
             else if(mcheck11.checked==false&&mcheck12.checked==false&&mcheck13.checked==false&&mcheck14.checked==false&&mcheck15.checked==false)
           	  mcheckall1.checked = false;
     	}
 		
 		function mcheck2(obj)
 		{
 			
			 var check21= document.getElementById("mcheck21");
			 var check22= document.getElementById("mcheck22");
			 
           var checkall2=document.getElementById("mcheckall2");
             if(obj.checked==true)
                 checkall2.checked = true;
             else if(check21.checked==false&&check22.checked==false)
                 checkall2.checked = false;
     	}
 		
 		function mcheck3(obj)
 		{
			 var check31= document.getElementById("mcheck31");
			 var check32= document.getElementById("mcheck32");
 			
            var checkall3=document.getElementById("mcheckall3");
             if(obj.checked==true)
                 checkall3.checked = true;
             else if(check31.checked==false&&check32.checked==false)
                 checkall3.checked = false;
     	}
 		
 		function mcheck4(obj)
 		{
			 var check41= document.getElementById("mcheck41");
			 var check42= document.getElementById("mcheck42");
			 var check43= document.getElementById("mcheck43");
			 var check44= document.getElementById("mcheck44");
			 
           var checkall4=document.getElementById("mcheckall4");
             if(obj.checked==true)
                 checkall4.checked = true;
             else if(check41.checked==false&&check42.checked==false&&check43.checked==false&&check44.checked==false)
                 checkall4.checked = false;
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
		document.getElementById("jsgl").setAttribute("class","list-group-item bg active");
      </script>
      
      <div class="panel panel-default col-sm-10 bg"><!--panel start-->
          <div class="panel-heading">
            <h3 class="panel-title">角色列表</h3>
          </div>
          <div class="panel-body"><!--panel body start-->
            <form class="form-horizontal" role="form" action="RoleManage" method="get">            
              <div class="form-group">
                <label for="角色名称" class="col-sm-2 control-label">角色名称：</label>
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
                    <th>角色名称</th>
                    <th>英文标识</th>
                    <th>角色描述</th>
                    <th>操作</th>
                </thead>
                <tbody>
                  <% if(roles!=null){ %>
                  <% for(int i=0;i<roles.size();i++){%>
                    <tr>
                        <td><%=roles.get(i).GetId()%></td>
                        <td><%=roles.get(i).GetName()%></td>
                        <td><%=roles.get(i).GetCode()%></td>
                        <td><%=roles.get(i).GetDescription()%></td>
                        <td>
                          <a onclick="document.getElementById('MNewNickName').value='<%=roles.get(i).GetName()%>';
                          			  document.getElementById('MNewCode').value='<%=roles.get(i).GetCode()%>';
                          			  document.getElementById('MNewDes').value='<%=roles.get(i).GetDescription()%>';
                          			  document.getElementById('Roleid').value='<%=roles.get(i).GetId()%>';" 
                          	 
                          			  data-toggle="modal" data-target="#myModal">修改</a>&nbsp;&nbsp;                        
                          <a href="javascript:DeleteRole('<%=roles.get(i).GetId()%>')">删除</a>
                        </td>
                    </tr>
                   <%} %>
                   <%} %>
                </tbody>
            </table>
            
            <form class="form-horizontal" role="form">
	            <div class="form-group">
		          <div class="col-sm-7 col-sm-offset-4">
                	<a id="pageone" onmouseover="ChangeHref('pageone')" class="col-sm-1 col-sm-offset-1" href="<%if(pageNo!=1){out.print("RoleManage?pageNo=1");}else{out.print("#");}%>"><span class="glyphicon glyphicon-fast-backward myclickstyle"></span></a>
	      	   		<a id="pagebefore" onmouseover="ChangeHref('pagebefore')" class="col-sm-1" href="<% if(pageNo>=2){out.print("RoleManage?pageNo="+(pageNo-1));}else{out.print("#");} %>"><span class="glyphicon glyphicon-arrow-left myclickstyle"></span></a>
	      	    	<span class="col-sm-3"><%=pageNo %>/<%=pageNum %>(共 <%=totalRecordNum%> 条)</span>
	      	    	<a id="pagenext" onmouseover="ChangeHref('pagenext')" class="col-sm-1" href="<% if(pageNo+1<=pageNum){out.print("RoleManage?pageNo="+(pageNo+1));}else{out.print("#");} %>"><span class="glyphicon glyphicon-arrow-right myclickstyle"></span></a>
	      	    	<a id="pagefinal" onmouseover="ChangeHref('pagefinal')" class="col-sm-1" href="<%if(pageNo!=pageNum){out.print("RoleManage?pageNo="+pageNum);}else{out.print("#");}%>"><span class="glyphicon glyphicon-fast-forward myclickstyle"></span></a>
	      	    	<!--<span>每页<input id="pageRecordNum" type="text" size="3" value="">条</span>-->
	          	  </div><!--display table page-->
		        </div>
                <div class="form-group">
                  <div class="col-sm-2 col-sm-offset-10">
                    <a class="btn btn-info btn-block" data-toggle="modal" data-target="#myModal2">增加角色</a>                    
                  </div>                              
                </div>		        
	        </form>
          </div><!--panel body over-->
      </div><!--panel over-->
      <!-- Modal -->
      <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">                
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">修改角色信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form" action="RoleManage.jsp" method="post">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">角色名称：</label><label id="Roleid" style="display:none"></label>
                        <div class="col-xs-3 col-sm-6">
                          <input type="text" class="form-control" id="MNewNickName"> 
                        </div>
                        <!-- <label for="用户名" class="col-sm-2 control-label" style="color:#FF0000;text-align:left;">已存在</label> -->
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">英文标识：</label>
                        <div class="col-xs-3 col-sm-6">
                          <input type="text" class="form-control" id="MNewCode">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">角色描述：</label>
                        <div class="col-xs-3 col-sm-6">
                          <input type="text" class="form-control" id="MNewDes">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">权限配置：</label>
                        <div class="col-sm-9">
				            <form class="form-horizontal" role="form" >
				            <form>            
				              <div class="form-group" style="margin-left:0px;">
				              	<div class="checkbox">
								    <label><input type="checkbox" id="mcheckall1" onClick="mcheckAllBox1(this);">合同管理</label>				           	                  
				                </div>
				              </div>
				              <div class="form-group" style="margin-left:20px;">
				              	<div class="checkbox col-sm-4">
								    <label><input type="checkbox" id="mcheck11" onClick="mcheck1(this);">起草合同</label>				           	                  
				                </div>
				              	<div class="checkbox col-sm-4">
								    <label><input type="checkbox" id="mcheck12" onClick="mcheck1(this);">会签合同</label>				           	                  
				                </div>
				              	<div class="checkbox col-sm-4">
								    <label><input type="checkbox" id="mcheck13" onClick="mcheck1(this);">定稿合同</label>			           	                  
				                </div>				                				                
				              </div>
				              <div class="form-group" style="margin-left:20px;">
				              	<div class="checkbox col-sm-4">
								    <label><input type="checkbox" id="mcheck14" onClick="mcheck1(this);">审批合同</label>				           	                  
				                </div>
				              	<div class="checkbox col-sm-4">
								    <label><input type="checkbox" id="mcheck15" onClick="mcheck1(this);">签订合同</label>				           	                  
				                </div>				                				                
				              </div>
				           </form> 
				             
				            <form>
				              <div class="form-group" style="margin-left:0px;">
				              	<div class="checkbox">
								    <label><input type="checkbox" id="mcheckall2" onClick="mcheckAllBox2(this);">查询统计</label>				           	                  
				                </div>
				              </div>
				              <div class="form-group" style="margin-left:20px;">
				              	<div class="checkbox col-sm-4">
								    <label><input type="checkbox" id="mcheck21" onClick="mcheck2(this);">合同信息查询</label>				           	                  
				                </div>
				              	<div class="checkbox col-sm-4">
								    <label><input type="checkbox" id="mcheck22" onClick="mcheck2(this);">合同流程查询</label>				           	                  
				                </div>	                				                
				              </div>
				             </form>
				             
				             <form>
				              <div class="form-group" style="margin-left:0px;">
				              	<div class="checkbox">
								    <label><input type="checkbox" id="mcheckall3" onClick="mcheckAllBox3(this);">基础数据管理</label>				           	                  
				                </div>
				              </div>
				              <div class="form-group" style="margin-left:20px;">
				              	<div class="checkbox col-sm-4">
								    <label><input type="checkbox" id="mcheck31" onClick="mcheck3(this);">合同信息管理</label>				           	                  
				                </div>
				              	<div class="checkbox col-sm-4">
								    <label><input type="checkbox" id="mcheck32" onClick="mcheck3(this);">客户信息管理</label>				           	                  
				                </div>				                				                
				              </div>
				             </form> 
				             
				             <form>
				              <div class="form-group" style="margin-left:0px;">
				              	<div class="checkbox">
								    <label><input type="checkbox" id="mcheckall4" onClick="mcheckAllBox4(this);">系统管理</label>				           	                  
				                </div>
				              </div>
				              <div class="form-group" style="margin-left:20px;">
				              	<div class="checkbox col-sm-4">
								    <label><input type="checkbox" id="mcheck41" onClick="mcheck4(this);">分配合同</label>				           	                  
				                </div>
				              	<div class="checkbox col-sm-4">
								    <label><input type="checkbox" id="mcheck42" onClick="mcheck4(this);">角色管理</label>				           	                  
				                </div>
				              	<div class="checkbox col-sm-4">
								    <label><input type="checkbox" id="mcheck43" onClick="mcheck4(this);">用户管理</label>				           	                  
				                </div>				                				                
				              </div>
				              <div class="form-group" style="margin-left:20px;">
				              	<div class="checkbox col-sm-4">
								    <label><input type="checkbox" id="mcheck44" onClick="mcheck4(this);">日志管理</label>				           	                  
				                </div>			                				                
				              </div>
				            </form>			              				              				              				              				              				              
				            </form>                        
                        </div>
                    </div>                    
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-info" onclick="return Modify()">修改</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>                   
                    </div>
                   </form>
                  </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
              </div>
         </div><!-- /.modal --> 
         
       <!-- Modal2 -->
      <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">                
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">增加角色</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form" action="RoleManage.jsp" method="post">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">角色名称：</label>
                        <div class="col-xs-3 col-sm-6">
                          <input type="text" class="form-control" id="RoleName" onblur="RequestForAddName()" onfocus="GetNewUsernameFocus()">
                        </div>
                        <label for="用户名" class="col-sm-3 control-label" style="color:#FF0000;text-align:left;">* &nbsp;&nbsp;<label id="nameValid"></label></label>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">英文标识：</label>
                        <div class="col-xs-3 col-sm-6">
                          <input type="text" class="form-control" id="RoleCode">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">角色描述：</label>
                        <div class="col-xs-3 col-sm-6">
                          <input type="text" class="form-control" id="RoleDescription">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">权限配置：</label>
                        <div class="col-sm-9">
				            <form class="form-horizontal" role="form">
				            <form>      
				              <div class="form-group" style="margin-left:0px;">
				              	<div class="checkbox">
								    <label><input type="checkbox" id="checkall1" name="checkall1" onClick="checkAllBox1(this);">合同管理</label>				           	                  
				                </div>
				              </div>
				              <div class="form-group" style="margin-left:20px;">
				              	<div class="checkbox col-sm-4">
								    <label><input type="checkbox" id="check11" name="check11" onClick="check1(this);">起草合同</label>				           	                  
				                </div>
				              	<div class="checkbox col-sm-4">
								    <label><input type="checkbox" id="check12" name="check12" onClick="check1(this);">会签合同</label>				           	                  
				                </div>
				              	<div class="checkbox col-sm-4">
								    <label><input type="checkbox" id="check13" name="check13" onClick="check1(this);">定稿合同</label>				           	                  
				                </div>				                				                
				              </div>
				              <div class="form-group" style="margin-left:20px;">
				              	<div class="checkbox col-sm-4">
								    <label><input type="checkbox" id="check14" name="check14" onClick="check1(this);">审批合同</label>				           	                  
				                </div>
				              	<div class="checkbox col-sm-4">
								    <label><input type="checkbox" id="check15" name="check15" onClick="check1(this);">签订合同</label>				           	                  
				                </div>				                				                
				              </div>
				             </form>   
				                 
				             <form> 
				              <div class="form-group" style="margin-left:0px;">
				              	<div class="checkbox">
								    <label><input type="checkbox" id="checkall2" name="checkall2" onClick="checkAllBox2(this);">查询统计</label>				           	                  
				                </div>
				              </div>
				              <div class="form-group" style="margin-left:20px;">
				              	<div class="checkbox col-sm-4">
								    <label><input type="checkbox" name="check21" id="check21" onClick="check2(this);">合同信息查询</label>				           	                  
				                </div>
				              	<div class="checkbox col-sm-4">
								    <label><input type="checkbox" name="check22" id="check22" onClick="check2(this);">合同流程查询</label>				           	                  
				                </div>				                				                
				              </div>
				              </form>
				              
				             <form>
				              <div class="form-group" style="margin-left:0px;">
				              	<div class="checkbox">
								    <label><input type="checkbox" id="checkall3" name="checkall3"  onClick="checkAllBox3(this);">基础数据管理</label>				           	                  
				                </div>
				              </div>
				              <div class="form-group" style="margin-left:20px;">
				              	<div class="checkbox col-sm-4">
								    <label><input type="checkbox" name="check31" id="check31" onClick="check3(this);">合同信息管理</label>				           	                  
				                </div>
				              	<div class="checkbox col-sm-4">
								    <label><input type="checkbox" name="check32" id="check32" onClick="check3(this);">客户信息管理</label>				           	                  
				                </div>				                				                
				              </div>
				              </form>
				              
				              <form>
				              <div class="form-group" style="margin-left:0px;">
				              	<div class="checkbox">
								    <label><input type="checkbox" id="checkall4" name="checkall4"  onClick="checkAllBox4(this);">系统管理</label>				           	                  
				                </div>
				              </div>
				              <div class="form-group" style="margin-left:20px;">
				              	<div class="checkbox col-sm-4">
								    <label><input type="checkbox" name="check41" id="check41" onClick="check4(this);">分配合同</label>				           	                  
				                </div>
				              	<div class="checkbox col-sm-4">
								    <label><input type="checkbox" name="check42" id="check42" onClick="check4(this);">角色管理</label>				           	                  
				                </div>
				              	<div class="checkbox col-sm-4">
								    <label><input type="checkbox" name="check43" id="check43" onClick="check4(this);">用户管理</label>				           	                  
				                </div>				                				                
				              </div>
				              <div class="form-group" style="margin-left:20px;">
				              	<div class="checkbox col-sm-4">
								    <label><input type="checkbox" name="check44" id="check44" onClick="check4(this);">日志管理</label>				           	                  
				                </div>			                				                
				              </div>				              				              				              				              				              				              
				            </form>  
				            </form>                      
                        </div>
                    </div>                     
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-info" onclick="return Add()">增加</button>
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